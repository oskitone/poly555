include <lib/values.scad>;

use <lib/basic_shapes.scad>;
use <lib/battery.scad>;
use <lib/enclosure.scad>;
use <lib/keys.scad>;
use <lib/mount_stilt.scad>;
use <lib/mounting_rail.scad>;
use <lib/pcb.scad>;
use <lib/speaker.scad>;
use <lib/switch.scad>;
use <lib/utils.scad>;

module assembly(
    key_gutter = 1,
    natural_key_exposed_height = 2,
    accidental_key_extra_height = 2,

    enclosure_wall = 2.5,
    enclosure_inner_wall = 1.2,
    enclosure_to_component_gutter = 2,
    enclosure_to_component_z_clearance = 2,
    enclosure_chamfer = 2,
    enclosure_rounding = 24,

    bottom_component_clearance = 1,

    mount_length = 6,

    tolerance = .1,

    keys_count = 13,
    starting_natural_key_index = 3,
    key_travel = 2,

    show_enclosure_bottom = true,
    show_battery = true,
    show_speaker = true,
    show_switch = true,
    show_pcb = true,
    show_mounting_rails = true,
    show_keys = true,
    show_enclosure_top = true,

    pcb_color = "purple",
    natural_key_color = "white",
    accidental_key_color = "black",
    key_opacity = 0.75
) {
    e = 0.0145;
    plot = PCB_BUTTONS[1][0] - PCB_BUTTONS[0][0];

    natural_key_width = plot * 2 - key_gutter;
    natural_key_length = natural_key_width * 4;

    mount_width= get_keys_total_width(
        count = keys_count,
        starting_note_index =
            get_starting_note_index(starting_natural_key_index),
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

    speaker_corner_gutter = 15;
    speaker_x = SPEAKER_DIAMETER / 2 + speaker_corner_gutter;
    speaker_y = enclosure_length - SPEAKER_DIAMETER / 2 - speaker_corner_gutter;

    switch_x = 15;
    switch_y = 15;
    switch_z = SWITCH_BASE_HEIGHT + SWITCH_ACTUATOR_HEIGHT
        + bottom_component_clearance;
    switch_exposure_height = switch_z - SWITCH_BASE_HEIGHT;

    battery_x = enclosure_width - BATTERY_WIDTH - enclosure_wall - tolerance;
    battery_y = enclosure_wall + tolerance;

    echo("Enclosure dimensions", [enclosure_width, enclosure_length, enclosure_height]);

    module _keys() {
        module _mounted_keys(
            include_natural = false,
            include_accidental = false
        ) {
            mounted_keys(
                count = keys_count,
                starting_natural_key_index = starting_natural_key_index,

                natural_width = natural_key_width,
                natural_length = natural_key_length,
                natural_height = key_height,

                accidental_width = 7.5,
                accidental_length = natural_key_length / 2,
                accidental_height = key_height + accidental_key_extra_height,

                gutter = key_gutter,

                undercarriage_height = BATTERY_HEIGHT
                    - (pcb_stilt_height + PCB_HEIGHT + mount_height)
                    + key_travel,
                undercarriage_length = key_mount_end_on_pcb,

                mount_length = mount_length,
                mount_hole_xs = mount_hole_xs,

                include_natural = include_natural,
                include_accidental = include_accidental
            );
        }

        translate([
            pcb_x + keys_from_pcb_x_offset,
            pcb_y + key_mount_end_on_pcb - natural_key_length,
            pcb_z + PCB_HEIGHT + BUTTON_HEIGHT
        ]) {
            color(natural_key_color, key_opacity) {
                _mounted_keys(include_natural = true);
            }
            color(accidental_key_color, key_opacity) {
                _mounted_keys(include_accidental = true);
            }
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
                tolerance = tolerance,

                $fn = enclosure_rounding
            );
        }

        module _switch_container(endstop_width = enclosure_inner_wall * 3) {
            // Walls
            translate([
                switch_x - SWITCH_ORIGIN.x - enclosure_inner_wall,
                switch_y - SWITCH_ORIGIN.y - enclosure_inner_wall,
                switch_exposure_height - e
            ]) {
                cube([
                    SWITCH_BASE_WIDTH + enclosure_inner_wall * 2,
                    SWITCH_BASE_LENGTH + enclosure_inner_wall * 2,
                    SWITCH_BASE_HEIGHT + e
                ]);
            }

            // Endstop
            translate([
                switch_x
                    + (SWITCH_BASE_WIDTH - endstop_width) / 2,
                switch_y - enclosure_inner_wall,
                switch_exposure_height + SWITCH_BASE_HEIGHT - e
            ]) {
                cube([
                    endstop_width,
                    SWITCH_BASE_LENGTH + enclosure_inner_wall * 2,
                    enclosure_inner_wall + e
                ]);
            }
        }

        module _battery_container(
            length = BATTERY_LENGTH * .5,
            snap_tolerance = 0, // TODO
            wall = enclosure_inner_wall,
            ramp = 5
        ) {
            translate([
                battery_x - snap_tolerance - wall - ramp,
                battery_y + (BATTERY_LENGTH - length) / 2,
                enclosure_wall
            ]) {
                flat_top_rectangular_pyramid(
                    top_width = wall,
                    top_length = length,
                    bottom_width = wall + ramp,
                    bottom_length = length,
                    height = BATTERY_HEIGHT * .67,
                    top_weight_x = 1
                );
            }
        }

        module _speaker_container(
            wall = enclosure_inner_wall,
            gap_width = 10,
            gap_count = 3
        ) {
            translate([speaker_x, speaker_y, enclosure_wall - e]) {
                difference() {
                    cylinder(
                        d = SPEAKER_DIAMETER + tolerance * 2 + wall * 2,
                        h = SPEAKER_HEIGHT + e
                    );

                    translate([0, 0, -e]) {
                        cylinder(
                            d = SPEAKER_DIAMETER + tolerance * 2,
                            h = SPEAKER_HEIGHT + e * 3
                        );
                    }

                    for (i = [0 : gap_count - 1]) {
                        rotate([0, 0, i * (360 / gap_count)]) {
                            translate([gap_width / -2, 0, 0]) {
                                cube([
                                    gap_width,
                                    SPEAKER_DIAMETER / 2 + wall + e,
                                    SPEAKER_HEIGHT + e * 3
                                ]);
                            }
                        }
                    }
                }
            }
        }

        module _speaker_cavities(
            diameter = 2,
            gutter = 2,
            engraving_depth = 1
        ) {
            plot = diameter + gutter;
            row_count = round((SPEAKER_DIAMETER / 2) / plot);

            translate([speaker_x, speaker_y, 0]) {
                difference() {
                    translate([0, 0, -e]) {
                        cylinder(
                            d = SPEAKER_DIAMETER + enclosure_inner_wall * 2,
                            h = engraving_depth + e
                        );
                    }

                    translate([0, 0, e * -2]) {
                        cylinder(
                            d = SPEAKER_DIAMETER,
                            h = engraving_depth + e * 3
                        );
                    }
                }

                for (row_i = [0 : row_count - 1]) {
                    row_diameter = plot * 2 * row_i;
                    col_count = max(round(row_diameter * PI / plot), 1);

                    for (col_i = [0: col_count - 1]) {
                        rotate([0, 0, col_i * (360 / col_count)]) {
                            translate([0, plot * row_i, -e]) {
                                cylinder(
                                    d = diameter,
                                    h = enclosure_wall + e * 2
                                );
                            }
                        }
                    }
                }
            }
        }

        module _bottom() {
            difference() {
                union() {
                    _enclosure_half(false);
                    _switch_container();
                    _switch_exposure(
                        xy_bleed = enclosure_inner_wall,
                        include_switch_cavity = false,
                        z_bleed = -e
                    );
                    _battery_container();
                    _speaker_container();
                    translate([pcb_x, pcb_y, pcb_z - e]) {
                        mount_stilts(
                            positions = PCB_HOLES,
                            height = pcb_stilt_height,
                            z = -pcb_stilt_height
                        );
                    }
                }

                _switch_exposure(
                    xy_bleed = tolerance / 2,
                    include_switch_cavity = true,
                    z_bleed = e
                );

                render() _speaker_cavities();
            }
        }

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
                translate([enclosure_width + e, e, enclosure_height]) {
                    rotate([180, 0, 180]) {
                        _enclosure_half(true);
                    }
                }
                _keys_cavity();
                _pcb_window_cavity();
            }
        }

        if (show_enclosure_top) { # _top(); }
        if (show_enclosure_bottom) { # _bottom(); }
    }

    module _battery() {
        available_length = pcb_y - enclosure_wall;
        required_length = BATTERY_LENGTH + tolerance * 2;

        assert(
            available_length > required_length,
            "Battery doesn't have enough space under keys"
        );

        translate([battery_x, battery_y, enclosure_wall + e]) {
            battery();
        }
    }

    module _speaker() {
        assert(pcb_stilt_height > SPEAKER_HEIGHT, "Speaker doesn't fit");

        translate([speaker_x, speaker_y, enclosure_wall - e]) {
            speaker();
        }
    }

    module _switch() {
        translate([switch_x, switch_y, switch_z]) {
            mirror([0, 0, 1]) {
                switch();
            }
        }
    }

    module _switch_exposure(
        xy_bleed = 0,
        include_switch_cavity = true,
        z_bleed = 0
    ) {
        width_extension = switch_exposure_height / 2;
        length_extension = switch_exposure_height / 2;

        translate([
            switch_x - SWITCH_ORIGIN.x - width_extension - xy_bleed,
            switch_y - SWITCH_ORIGIN.y - length_extension - xy_bleed,
            -z_bleed
        ]) {
            flat_top_rectangular_pyramid(
                top_width = SWITCH_BASE_WIDTH + xy_bleed * 2,
                top_length = SWITCH_BASE_LENGTH + xy_bleed * 2,

                bottom_width = SWITCH_BASE_WIDTH + xy_bleed * 2
                    + width_extension * 2,
                bottom_length = SWITCH_BASE_LENGTH + xy_bleed * 2
                    + length_extension * 2,

                height = switch_exposure_height + z_bleed * 2
            );
        }

        if (include_switch_cavity) {
            translate([
                switch_x - SWITCH_ORIGIN.x - xy_bleed,
                switch_y - SWITCH_ORIGIN.y - xy_bleed,
                switch_exposure_height - z_bleed
            ]) {
                cube([
                    SWITCH_BASE_WIDTH + xy_bleed * 2,
                    SWITCH_BASE_LENGTH + xy_bleed * 2,
                    SWITCH_BASE_HEIGHT + z_bleed * 2
                ]);
            }
        }
    }

    module _pcb() {
        translate([pcb_x, pcb_y, pcb_z]) {
            pcb(
                visualize_non_button_components = true,
                pcb_color = pcb_color,
                opacity = .5
            );
        }
    }

    module _mounting_rails() {
        module _mounting_rail(y, height_difference = 0) {
            translate([
                pcb_x + keys_from_pcb_x_offset,
                pcb_y + y,
                pcb_z + PCB_HEIGHT
            ]) {
                mounting_rail(
                    width = mount_width,
                    length = mount_length,
                    height = mount_height - height_difference,
                    hole_xs = mount_hole_xs
                );
            }
        }

        _mounting_rail(key_mount_end_on_pcb - mount_length);
        _mounting_rail(PCB_HOLES[5][1] - mount_length / 2, 1);
    }

    _enclosure();
    if (show_battery) { % _battery(); }
    if (show_speaker) { % _speaker(); }
    if (show_switch) { % _switch(); }
    if (show_pcb) { % _pcb(); }
    if (show_mounting_rails) { _mounting_rails(); }
    if (show_keys) { _keys(); }
}

intersection() {
    assembly(
        show_enclosure_bottom = true,
        show_battery = true,
        show_speaker = true,
        show_switch = true,
        show_pcb = true,
        show_mounting_rails = true,
        show_keys = true,
        show_enclosure_top = true
    );
    /* translate([-20, -20, -20]) cube([35, 300, 100]); // switch */
}
