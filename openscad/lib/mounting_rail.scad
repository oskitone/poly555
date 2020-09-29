include <values.scad>;

use <basic_shapes.scad>;

module mounting_rail(
    width = 0,
    length = 0,
    height = 1,
    hole_xs = [],
    hole_xs_x_offset = 0,
    hole_diameter = PCB_MOUNT_HOLE_DIAMETER,
    $fn = DEFAULT_ROUNDING
) {
    e = 0.0567;

    difference() {
        cube([width, length, height]);

        translate([hole_xs_x_offset, 0, 0]) {
            hole_array(
                hole_xs,
                hole_diameter,
                height + e * 2,
                length / 2,
                -e,
                square = false
            );
        }
    }
}

mounting_rail(
    width = 10 * 8 + 1 * (8 - 1),
    length = 5,
    height = 8,
    hole_xs = [5, 30, 40, 65, 82],
    hole_diameter = 2
);
