include <values.scad>;

use <basic_shapes.scad>;

module mounting_rail(
    width = 0,
    length = 0,
    height = 1,
    hole_xs = [],
    hole_diameter = PCB_MOUNT_HOLE_DIAMETER,

    include_head_cavity = false,
    head_hole_diameter = SCREW_HEAD_DIAMETER,
    head_hole_height = SCREW_HEAD_HEIGHT,

    $fn = DEFAULT_ROUNDING
) {
    e = 0.0567;

    difference() {
        cube([width, length, height]);

        hole_array(
            hole_xs,
            hole_diameter,
            height + e * 2,
            length / 2,
            -e
        );

        if (include_head_cavity) {
            hole_array(
                hole_xs,
                head_hole_diameter,
                head_hole_height + e,
                length / 2,
                height - head_hole_height
            );
        }
    }
}

mounting_rail(
    width = 10 * 8 + 1 * (8 - 1),
    length = 5,
    height = 6,
    hole_xs = [5, 30, 40, 65, 82],
    hole_diameter = 2,
    include_head_cavity = true
);
