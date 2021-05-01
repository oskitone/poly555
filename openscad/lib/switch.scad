include <values.scad>;

use <basic_shapes.scad>;

module switch(position = 0) {
    e = .05234;

    translate([-SWITCH_ORIGIN.x, -SWITCH_ORIGIN.y, 0]) {
        cube([
            SWITCH_BASE_WIDTH,
            SWITCH_BASE_LENGTH,
            SWITCH_BASE_HEIGHT
        ]);

        translate([
            (SWITCH_BASE_WIDTH - SWITCH_ACTUATOR_WIDTH) / 2,
            (SWITCH_BASE_LENGTH - SWITCH_ACTUATOR_LENGTH) / 2
                - SWITCH_ACTUATOR_TRAVEL / 2
                + SWITCH_ACTUATOR_TRAVEL * position,
            SWITCH_BASE_HEIGHT - e
        ]) {
            cube([
                SWITCH_ACTUATOR_WIDTH,
                SWITCH_ACTUATOR_LENGTH,
                SWITCH_ACTUATOR_HEIGHT + e
            ]);
        }
    }
}

module switch_container(
    position,
    exposure_height,
    wall
) {
    e = .082345;

    translate([
        position.x - SWITCH_ORIGIN.x - wall,
        position.y - SWITCH_ORIGIN.y - wall,
        exposure_height - e
    ]) {
        cube([
            SWITCH_BASE_WIDTH + wall * 2,
            SWITCH_BASE_LENGTH + wall * 2,
            SWITCH_BASE_HEIGHT + e
        ]);
    }
}

module switch_exposure(
    position = [0, 0, 0],
    exposure_height,
    xy_bleed = 0,
    include_switch_cavity = true,
    z_bleed = 0
) {
    width_extension = exposure_height;
    length_extension = exposure_height;

    translate([
        position.x - SWITCH_ORIGIN.x - width_extension - xy_bleed,
        position.y - SWITCH_ORIGIN.y - length_extension - xy_bleed,
        -z_bleed
    ]) {
        flat_top_rectangular_pyramid(
            top_width = SWITCH_BASE_WIDTH + xy_bleed * 2,
            top_length = SWITCH_BASE_LENGTH + xy_bleed * 2,

            bottom_width = SWITCH_BASE_WIDTH + xy_bleed * 2
                + width_extension * 2,
            bottom_length = SWITCH_BASE_LENGTH + xy_bleed * 2
                + length_extension * 2,

            height = exposure_height + z_bleed * 2
        );
    }

    if (include_switch_cavity) {
        translate([
            position.x - SWITCH_ORIGIN.x - xy_bleed,
            position.y - SWITCH_ORIGIN.y - xy_bleed,
            exposure_height - z_bleed
        ]) {
            cube([
                SWITCH_BASE_WIDTH + xy_bleed * 2,
                SWITCH_BASE_LENGTH + xy_bleed * 2,
                SWITCH_BASE_HEIGHT + z_bleed * 2
            ]);
        }
    }
}

switch();
