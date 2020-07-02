PCB_WIDTH = 114.3;
PCB_LENGTH = 140.97;
PCB_HEIGHT = 1.6;
PCB_MOUNT_HOLE_DIAMETER = 3;

BUTTON_DIAMETER = 6;
BUTTON_HEIGHT = 6;

PCB_HOLES = [
    [3.81, 137.16],
    [110.49, 137.16],

    [3.81, 27.94],
    [57.15, 27.94],
    [110.49, 27.94],

    [3.81, 3.81],
    [57.15, 3.81],
    [110.49, 3.81],
];

PCB_BUTTONS = [
    [6.096 - 2.286, 10.922],
    [13.716 - 2.286, 16.002],
    [21.336 - 2.286, 10.922],
    [28.956 - 2.286, 16.002],
    [36.576 - 2.286, 10.922],
    [44.196 - 2.286, 16.002],
    [112.776 - 2.286, 10.922],
    [51.816 - 2.286, 10.922],
    [67.056 - 2.286, 10.922],
    [74.676 - 2.286, 16.002],
    [82.296 - 2.286, 10.922],
    [89.916 - 2.286, 16.002],
    [97.536 - 2.286, 10.922],
];

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
