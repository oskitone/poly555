PCB_WIDTH = 114.3;
PCB_LENGTH = 140.97;
PCB_HEIGHT = 1.6;
PCB_MOUNT_HOLE_DIAMETER = 3;

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

module pcb(
    dimensions = [PCB_WIDTH, PCB_LENGTH, PCB_HEIGHT],
    hole_positions = PCB_HOLES
) {
    e = 0.0567;

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
