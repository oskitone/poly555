include <lib/values.scad>;

use <lib/battery.scad>;
use <lib/enclosure.scad>;
use <lib/keys.scad>;
use <lib/mount_stilt.scad>;
use <lib/mounting_rail.scad>;
use <lib/pcb.scad>;
use <lib/speaker.scad>;
use <lib/utils.scad>;

module assembly(
    key_gutter = 1,
    natural_key_exposed_height = 2,
    accidental_key_extra_height = 2,

    enclosure_wall = 2.5,
    enclosure_to_component_gutter = 2,
    enclosure_to_component_z_clearance = 2,
    enclosure_chamfer = 2,

    mount_length = 6,

    tolerance = .1,

    pcb_color = "purple",
    natural_key_color = "white",
    accidental_key_color = "black",
    key_opacity = 0.75
) {
    e = 0.09876;
    plot = PCB_BUTTONS[1][0] - PCB_BUTTONS[0][0];

    natural_key_width = plot * 2 - key_gutter;
    natural_key_length = natural_key_width * 4;

    mount_width= get_keys_total_width(
        count = 13,
        starting_note_index = 5,
        natural_width = natural_key_width,
        gutter = key_gutter
    );
    mount_height = BUTTON_HEIGHT;

    key_mount_end_on_pcb = PCB_HOLES[2][1] + mount_length / 2;

    mount_hole_x_offset = (PCB_WIDTH / 15) - PCB_HOLES[2][0] - key_gutter / 2;
    mount_hole_xs = [
        PCB_HOLES[2][0] + mount_hole_x_offset,
        PCB_HOLES[3][0] + mount_hole_x_offset,
        PCB_HOLES[4][0] + mount_hole_x_offset,
    ];

    keys_y_over_pcb = natural_key_length - key_mount_end_on_pcb;

    keys_from_pcb_x_offset = PCB_BUTTONS[0][0] - plot + key_gutter / 2;

    pcb_x = enclosure_wall + enclosure_to_component_gutter -
        keys_from_pcb_x_offset;
    pcb_y = enclosure_wall + enclosure_to_component_gutter + keys_y_over_pcb;
    pcb_z = enclosure_wall + max(
        MOUNT_STILT_MINIMUM_HEIGHT,
        SPEAKER_HEIGHT + SPEAKER_CLEARANCE
    );
    pcb_stilt_height = pcb_z - enclosure_wall;

    enclosure_width = enclosure_wall * 2 + enclosure_to_component_gutter * 2
        + mount_width;
    enclosure_length = enclosure_wall * 2 + enclosure_to_component_gutter * 2
        + PCB_LENGTH + keys_y_over_pcb;
    enclosure_height = enclosure_wall * 2
        + pcb_stilt_height
        + PCB_HEIGHT + PCB_COMPONENTS_HEIGHT
        + enclosure_to_component_z_clearance;

    key_height = enclosure_height - pcb_stilt_height - enclosure_wall
        - PCB_HEIGHT - mount_height + natural_key_exposed_height;

    module _mounting_rail(y, height_difference = 0) {
        translate([keys_from_pcb_x_offset, y, PCB_HEIGHT]) {
            # mounting_rail(
                width = mount_width,
                length = mount_length,
                height = mount_height - height_difference,
                hole_xs = mount_hole_xs,
                hole_diameter = 2
            );
        }
    }

    module _mounted_keys(
        include_natural = false,
        include_accidental = false
    ) {
        translate([
            keys_from_pcb_x_offset,
            key_mount_end_on_pcb - natural_key_length,
            PCB_HEIGHT + BUTTON_HEIGHT
        ]) {
            mounted_keys(
                count = 13,
                starting_natural_key_index = 3,

                natural_width = natural_key_width,
                natural_length = natural_key_length,
                natural_height = key_height,

                accidental_width = 7.5,
                accidental_length = natural_key_length / 2,
                accidental_height = key_height + accidental_key_extra_height,

                gutter = key_gutter,

                mount_length = mount_length,
                mount_hole_xs = mount_hole_xs,

                include_natural = include_natural,
                include_accidental = include_accidental
            );
        }
    }

    module _enclosure() {
        module _enclosure_half(is_top) {
            enclosure_half(
                width = enclosure_width,
                length = enclosure_length,
                total_height = enclosure_height,

                wall = enclosure_wall,
                floor_ceiling = undef,

                add_lip = !is_top,
                remove_lip = is_top,

                include_hinge = true,
                include_hinge_parts = true,

                hinge_count = 2,
                include_clasp = true,
                just_hinge_parts = false,
                radius = enclosure_chamfer,
                tolerance = tolerance
            );
        }

        module _bottom() { _enclosure_half(false); }

        module _top(window_cavity_gutter = 2) {
            module _keys_cavity(gutter = key_gutter) {
                translate([
                    enclosure_wall + enclosure_to_component_gutter - gutter,
                    enclosure_wall + enclosure_to_component_gutter - gutter,
                    enclosure_height - enclosure_wall - e
                ]) {
                    cube([
                        mount_width + gutter * 2,
                        natural_key_length + gutter * 2,
                        enclosure_wall + e * 2
                    ]);
                }
            }

            module _pcb_window_cavity(
                width = PCB_WIDTH - window_cavity_gutter * 2,
                length = PCB_LENGTH - key_mount_end_on_pcb -
                    window_cavity_gutter * 2
            ) {
                translate([
                    pcb_x + window_cavity_gutter,
                    pcb_y + key_mount_end_on_pcb + window_cavity_gutter,
                    enclosure_height - enclosure_wall - e
                ]) {
                    cube([width, length, enclosure_wall + e * 2]);
                }
            }

            difference() {
                translate([enclosure_width + e, e, enclosure_height + e]) {
                    rotate([180, 0, 180]) {
                        _enclosure_half(true);
                    }
                }
                _keys_cavity();
                _pcb_window_cavity();
            }
        }

        # _top();
        # _bottom();

        translate([pcb_x, pcb_y, pcb_z - e]) {
            mount_stilts(
                positions = PCB_HOLES,
                height = pcb_stilt_height,
                z = -pcb_stilt_height
            );
        }
    }

    module _battery() {
        available_length = pcb_y - enclosure_wall;
        required_length = BATTERY_LENGTH + tolerance * 2;

        assert(
            available_length > required_length,
            "Battery doesn't have enough space under keys"
        );

        translate([
            enclosure_width - BATTERY_WIDTH - enclosure_wall,
            enclosure_wall + tolerance,
            enclosure_wall
        ]) {
            battery();
        }
    }

    module _speaker() {
        assert(pcb_stilt_height > SPEAKER_HEIGHT, "Speaker doesn't fit");

        translate([
            pcb_x + (PCB_HOLES[2][0] + PCB_HOLES[3][0]) / 2,
            enclosure_wall + enclosure_to_component_gutter + SPEAKER_DIAMETER / 2,
            enclosure_wall
        ]) {
            speaker();
        }
    }

    _enclosure();

    translate([pcb_x, pcb_y, pcb_z]) {
        color(pcb_color) pcb(visualize_non_button_components = true);

        _mounting_rail(key_mount_end_on_pcb - mount_length);
        _mounting_rail(PCB_HOLES[5][1] - mount_length / 2, 1);

        color(natural_key_color, key_opacity)
            _mounted_keys(include_natural = true);
        color(accidental_key_color, key_opacity)
            _mounted_keys(include_accidental = true);
    }

    _battery();
    _speaker();
}

assembly();
