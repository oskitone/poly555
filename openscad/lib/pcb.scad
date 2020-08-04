include <values.scad>;

use <switch.scad>;
use <trimpot_knob.scad>;

module pcb(
    dimensions = [PCB_WIDTH, PCB_LENGTH, PCB_HEIGHT],
    hole_positions = PCB_HOLES,
    button_positions = PCB_BUTTONS,
    pcb_color = "purple",
    button_color = "black",
    opacity = 1,

    volume_wheel_diameter = 20,
    volume_wheel_grip_size = 0,

    visualize_board = true,
    visualize_buttons = false,
    visualize_silkscreen = false,
    visualize_circuit_space = false,
    visualize_volume_wheel = false,
    visualize_switch = false,

    $fn = DEFAULT_ROUNDING
) {
    e = 0.0567;

    if (visualize_buttons) {
        for (xy = button_positions) {
            translate([
                xy[0] - BUTTON_WIDTH / 2,
                xy[1] + BUTTON_LENGTH / 2,
                PCB_HEIGHT
            ]) {
                color(button_color, opacity) cylinder(
                    d = BUTTON_DIAMETER,
                    h = BUTTON_HEIGHT
                );
            }
        }
    }

    if (visualize_silkscreen) {
        // magic...
        translate([-16.25, -0.5, PCB_HEIGHT]) {
            render() linear_extrude(1) offset(delta = .2) {
                import("../../poly_555-brd.svg");
            }
        }
    }

    if (visualize_circuit_space) {
        z = PCB_HEIGHT - e;

        difference() {
            translate([PCB_COMPONENTS_X, PCB_COMPONENTS_Y, z]) {
                % cube([
                    PCB_COMPONENTS_WIDTH,
                    PCB_COMPONENTS_LENGTH,
                    PCB_COMPONENTS_HEIGHT
                ]);
            }

            translate([
                PCB_BATTERY_CAVITY_X - PCB_COMPONENTS_X,
                PCB_BATTERY_CAVITY_Y - PCB_COMPONENTS_X,
                z - e
            ]) {
                cube([
                    PCB_WIDTH - PCB_BATTERY_CAVITY_X + PCB_COMPONENTS_X * 2,
                    PCB_BATTERY_CAVITY_LENGTH + PCB_COMPONENTS_X * 2,
                    PCB_COMPONENTS_HEIGHT + z
                ]);
            }
        }
    }

    // TODO: account for cap height in Z position
    // TODO: flip upside down
    if (visualize_volume_wheel) {
        translate([
            PCB_VOLUME_WHEEL_X,
            PCB_VOLUME_WHEEL_Y,
            POT_HEIGHT
        ]) {
            trimpot_knob(
                diameter = volume_wheel_diameter,
                grip_size = volume_wheel_grip_size
            );
        }
    }

    if (visualize_switch) {
        translate([PCB_SWITCH_X, PCB_SWITCH_Y, 0]) {
            mirror([0, 0, 1]) {
                switch();
            }
        }
    }

    if (visualize_board) {
        difference() {
            color(pcb_color, opacity) cube(dimensions);

            translate([PCB_BATTERY_CAVITY_X, PCB_BATTERY_CAVITY_Y, -e]) {
                cube([
                    PCB_WIDTH - PCB_BATTERY_CAVITY_X + e,
                    PCB_BATTERY_CAVITY_LENGTH,
                    PCB_HEIGHT + e * 2
                ]);
            }

            for (xy = hole_positions) {
                translate([xy[0], xy[1], -e]) {
                    cylinder(
                        d = PCB_MOUNT_HOLE_DIAMETER,
                        h = PCB_HEIGHT + e * 2
                    );
                }
            }
        }
    }
}

pcb(
    visualize_board = true,
    visualize_buttons = true,
    visualize_silkscreen = true,
    visualize_circuit_space = true,
    visualize_volume_wheel = true,
    visualize_switch = true
);
