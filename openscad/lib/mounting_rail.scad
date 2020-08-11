include <values.scad>;

use <basic_shapes.scad>;

module mounting_rail(
    width = 0,
    length = 0,
    height = 1,
    hole_xs = [],
    hole_xs_x_offset = 0,
    hole_diameter = PCB_MOUNT_HOLE_DIAMETER,

    include_head_cavity = false,
    head_hole_diameter = SCREW_HEAD_DIAMETER,
    head_hole_height = SCREW_HEAD_HEIGHT,

    include_nut_cavity = false,
    nut_lock_diameter = NUT_DIAMETER + .5,
    nut_lock_height = NUT_HEIGHT + 0,
    nut_lock_z = 0,

    // TODO: obviate
    include_sacrificial_bridge = false,

    $fn = DEFAULT_ROUNDING
) {
    e = 0.0567;

    module _hole_array(
        diameter = head_hole_diameter,
        height = head_hole_height + e,
        z = -e,
        square = false
    ) {
        translate([hole_xs_x_offset, 0, 0]) {
            hole_array(
                hole_xs,
                diameter,
                height,
                length / 2,
                z,
                square = square
            );
        }
    }

    module _cavities() {
        difference() {
            union() {
                _hole_array(
                    diameter = hole_diameter,
                    height = height + e * 2,
                    z = -e
                );

                if (include_head_cavity) {
                    _hole_array(z = height - head_hole_height);
                }

                if (include_nut_cavity) {
                    _hole_array(
                        diameter = nut_lock_diameter,
                        height = nut_lock_height + e,
                        z = nut_lock_z - e,
                        square = true
                    );
                }
            }

            // TODO: bridge top vs bottom
            if (
                include_nut_cavity
                && include_sacrificial_bridge
                && (nut_lock_z + nut_lock_height < height)
            ) {
                _hole_array(
                    diameter = hole_diameter + e * 2,
                    height = SACRIFICIAL_BRIDGE_HEIGHT,
                    z = nut_lock_z + nut_lock_height
                );
            }
        }
    }

    difference() {
        cube([width, length, height]);
        _cavities();
    }
}

mounting_rail(
    width = 10 * 8 + 1 * (8 - 1),
    length = 5,
    height = 8,
    hole_xs = [5, 30, 40, 65, 82],
    hole_diameter = 2,
    include_head_cavity = true,
    include_nut_cavity = true,
    nut_lock_z = 1,
    include_sacrificial_bridge = true
);
