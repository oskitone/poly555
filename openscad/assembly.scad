include <lib/values.scad>;

use <lib/enclosure.scad>;
use <lib/keys.scad>;
use <lib/mounting_rail.scad>;
use <lib/pcb.scad>;
use <lib/utils.scad>;

module assembly(
    key_gutter = 1,
    key_height = 4,
    key_exposed_height = 2,

    enclosure_wall = 2.5,
    enclosure_to_component_gutter = 2,
    enclosure_chamfer = 2,

    mount_length = 6,

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

    // TODO: decouple from PCB
    keys_x = PCB_BUTTONS[0][0] - plot + key_gutter / 2;
    keys_z = PCB_HEIGHT + BUTTON_HEIGHT;

    enclosure_width = enclosure_wall * 2 + enclosure_to_component_gutter * 2
        + mount_width;
    enclosure_length = enclosure_wall * 2 + enclosure_to_component_gutter * 2
        + PCB_LENGTH + keys_y_over_pcb;
    enclosure_height = MINIMUM_HINGE_CLASP_LENGTH + enclosure_chamfer * 2;

    pcb_x = -keys_x + enclosure_wall + enclosure_to_component_gutter;
    pcb_y = enclosure_wall + enclosure_to_component_gutter + keys_y_over_pcb;
    pcb_z = enclosure_height - PCB_HEIGHT - mount_height
        - (key_height - key_exposed_height);

    module _mounting_rail(y, height_difference = 0) {
        translate([keys_x, y, PCB_HEIGHT]) {
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
            keys_x,
            key_mount_end_on_pcb - natural_key_length,
            keys_z
        ]) {
            mounted_keys(
                count = 13,
                starting_natural_key_index = 3,

                natural_width = natural_key_width,
                natural_length = natural_key_length,
                natural_height = key_height,

                accidental_width = 7.5,
                accidental_length = natural_key_length / 2,
                accidental_height = 6,

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
                tolerance = .1
            );
        }

        module _bottom() { _enclosure_half(false); }

        module _top() {
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

            difference() {
                translate([enclosure_width + e, e, enclosure_height + e]) {
                    rotate([180, 0, 180]) {
                        _enclosure_half(true);
                    }
                }
                _keys_cavity();
            }
        }

        # _top();
        # _bottom();
    }

    _enclosure();

    translate([pcb_x, pcb_y, pcb_z]) {
        color(pcb_color) pcb();

        _mounting_rail(key_mount_end_on_pcb - mount_length);
        _mounting_rail(PCB_HOLES[5][1] - mount_length / 2, 1);

        color(natural_key_color, key_opacity)
            _mounted_keys(include_natural = true);
        color(accidental_key_color, key_opacity)
            _mounted_keys(include_accidental = true);
    }
}

assembly();
