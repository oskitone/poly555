include <values.scad>;

use <basic-shapes.scad>;

module mounting_rail(
    width = 0,
    length = 0,
    height = 1,
    hole_xs = [],
    hole_diameter = PCB_MOUNT_HOLE_DIAMETER
) {
    e = 0.0567;

    $fn = 24;

    difference() {
        cube([width, length, height]);
        hole_array(
            hole_xs,
            hole_diameter,
            height + e * 2,
            length / 2,
            -e
        );
    }
}

mounting_rail(
    width = 10 * 8 + 1 * (8 - 1),
    length = 5,
    height = 6,
    hole_xs = [5, 30, 40, 65, 82],
    hole_diameter = 2
);
