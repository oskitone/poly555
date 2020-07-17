include <values.scad>;

module pcb(
    dimensions = [PCB_WIDTH, PCB_LENGTH, PCB_HEIGHT],
    hole_positions = PCB_HOLES,
    button_positions = PCB_BUTTONS,
    pcb_color = "purple",
    button_color = "black",
    opacity = 1,
    visualize_silkscreen = false,
    visualize_non_button_components = false
) {
    e = 0.0567;

    assert(
        !(visualize_silkscreen && visualize_non_button_components),
        "Can't do both visualize_silkscreen and visualize_non_button_components"
    )

    for (xy = button_positions) {
        translate([xy[0], xy[1], PCB_HEIGHT + e]) {
            color(button_color, opacity) cylinder(
                d = BUTTON_DIAMETER,
                h = BUTTON_HEIGHT - e
            );
        }
    }

    if (visualize_silkscreen) {
        // magic...
        translate([-5.49, -4.6, PCB_HEIGHT]) {
            render() linear_extrude(1) offset(delta = .2) {
                import("../../poly_555-brd.svg");
            }
        }
    }

    if (visualize_non_button_components) {
        translate([PCB_COMPONENTS_X, PCB_COMPONENTS_Y, PCB_HEIGHT - e]) {
            % cube([
                PCB_COMPONENTS_WIDTH,
                PCB_COMPONENTS_LENGTH,
                PCB_COMPONENTS_HEIGHT
            ]);
        }
    }

    difference() {
        color(pcb_color, opacity) cube(dimensions);

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

pcb(visualize_silkscreen = true);
translate([PCB_WIDTH + 10, 0, 0]) pcb(visualize_non_button_components = true);
