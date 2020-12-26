include <values.scad>;
include <utils.scad>;

use <switch.scad>;
use <trimpot_knob.scad>;

module pcb(
    dimensions = [PCB_WIDTH, PCB_LENGTH, PCB_HEIGHT],
    hole_positions = PCB_HOLES,
    button_positions = PCB_BUTTONS,
    pcb_color = "purple",
    button_color = "black",
    opacity = 1,

    simplify_volume_wheel = false,
    volume_wheel_diameter = 20,
    volume_wheel_grip_size = 0,
    volume_wheel_cap_height = 1,

    visualize_board = true,
    visualize_buttons = false,
    visualize_silkscreen = false,
    visualize_circuit_space = false,
    visualize_volume_pot = false,
    visualize_volume_wheel = false,
    visualize_switch = false,
    visualize_led = false,

    $fn = DEFAULT_ROUNDING
) {
    e = 0.0567;
    silkscreen_height = e;

    module _holes() {
        for (xy = hole_positions) {
            translate([xy[0], xy[1], -e]) {
                cylinder(
                    d = PCB_MOUNT_HOLE_DIAMETER,
                    h = PCB_HEIGHT + silkscreen_height + e * 2
                );
            }
        }
    }

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
        difference() {
            // magic...
            translate([-14.73, -2.54, PCB_HEIGHT]) {
                render() linear_extrude(silkscreen_height) offset(delta = .2) {
                    import("../../poly_555-brd.svg");
                }
            }

            _holes();
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
        }
    }

    if (visualize_volume_pot) {
        translate([PCB_VOLUME_WHEEL_X, PCB_VOLUME_WHEEL_Y, PCB_HEIGHT]) {
            % cylinder(
                d = TRIMPOT_KNOB_HEAD_DIAMETER,
                h = POT_HEIGHT
            );
        }
    }

    if (visualize_volume_wheel) {
        translate([
            PCB_VOLUME_WHEEL_X,
            PCB_VOLUME_WHEEL_Y,
            get_volume_wheel_z(cap_height = volume_wheel_cap_height)
        ]) {
            trimpot_knob(
                diameter = volume_wheel_diameter,
                grip_size = volume_wheel_grip_size,
                cap_height = volume_wheel_cap_height,
                simplify = simplify_volume_wheel,
                flip = true
            );
        }
    }

    if (visualize_switch) {
        translate([PCB_SWITCH_X, PCB_SWITCH_Y, 0]) {
            mirror([0, 0, 1]) {
                % switch();
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

            _holes();
        }
    }

    if (visualize_led) {
        translate([PCB_LED_X, PCB_LED_Y, PCB_HEIGHT]) {
            cylinder(d = LED_DIAMETER, h = LED_HEIGHT);
        }
    }
}

pcb(
    visualize_board = true,
    visualize_buttons = true,
    visualize_silkscreen = true,
    visualize_circuit_space = true,
    visualize_volume_pot = true,
    visualize_volume_wheel = true,
    visualize_switch = true,
    visualize_led = true
);
