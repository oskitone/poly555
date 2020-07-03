include <values.scad>;

module pcb(
    dimensions = [PCB_WIDTH, PCB_LENGTH, PCB_HEIGHT],
    hole_positions = PCB_HOLES,
    button_positions = PCB_BUTTONS
) {
    e = 0.0567;

    for (xy = button_positions) {
        translate([xy[0], xy[1], PCB_HEIGHT + e]) {
            # cylinder(
                d = BUTTON_DIAMETER,
                h = BUTTON_HEIGHT - e
            );
        }
    }

    difference() {
        cube(dimensions);

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

pcb();
