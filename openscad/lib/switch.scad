include <values.scad>;

module switch(position = 0) {
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
            SWITCH_BASE_HEIGHT
        ]) {
            # cube([
                SWITCH_ACTUATOR_WIDTH,
                SWITCH_ACTUATOR_LENGTH,
                SWITCH_ACTUATOR_HEIGHT
            ]);
        }
    }
}

switch();
