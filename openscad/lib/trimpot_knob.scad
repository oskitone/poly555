include <values.scad>;

use <basic_shapes.scad>;

module trimpot_knob(
    diameter = 21,

    cap_height = 1,

    head_diameter = TRIMPOT_KNOB_HEAD_DIAMETER,
    head_height = TRIMPOT_KNOB_HEAD_HEIGHT,
    head_flat_depth = .55,

    simplify = false,

    wall = 1.8,

    grip_size = 1.5,

    tolerance = .1,
    head_lock_chamfer = .4,

    shim_size = .8,

    flip = false,

    $fn = HIDEF_ROUNDING
) {
    e = 0.0047;

    total_height = cap_height * 2 + head_height;
    inner_diameter = head_diameter + tolerance * 2 + wall * 2;

    module _head_lock() {
        z = cap_height - e;

        difference() {
            union() {
                translate([0, 0, z]) {
                    ring(
                        diameter = inner_diameter,
                        height = head_height + e,
                        thickness = wall
                    );

                    cylinder_grip(
                        diameter = head_diameter + tolerance * 2,
                        height = head_height + e,
                        count = 3,
                        rotation_offset = 180,
                        size = shim_size
                    );
                }

                translate([
                    head_diameter / -2,
                    head_diameter / -2 - tolerance,
                    z
                ]) {
                    cube([
                        head_diameter,
                        head_flat_depth - tolerance + e,
                        head_height + e,
                    ]);
                }
            }

            if (head_lock_chamfer > 0) {
                translate([0, 0, z + head_height - head_lock_chamfer + e]) {
                    cylinder(
                        d1 = min(
                            inner_diameter - wall * 2 - shim_size,
                            head_diameter - head_flat_depth - tolerance * 2
                        ),
                        d2 = inner_diameter - wall * 2 + head_lock_chamfer,
                        h = head_lock_chamfer + e
                    );
                }
            }
        }
    }

    module _spokes(width = 1.8, count = 4) {
        e = .1;

        y = inner_diameter / 2 - e;
        length = diameter / 2 - y - wall + e;

        for (i = [0 : count - 1]) {
            rotate([0, 0, 360 / count * i]) {
                translate([width / -2, y, 0]) {
                    cube([
                        width,
                        length,
                        cap_height + head_height
                    ]);
                    translate([0, 0, cap_height + head_height - e]) {
                        flat_top_rectangular_pyramid(
                            top_width = width,
                            top_length = 0,

                            bottom_width = width,
                            bottom_length = length,

                            height = cap_height + e,

                            top_weight_y = 1
                        );
                    }
                }
            }
        }
    }

    mirror([0, 0, flip ? 1 : 0]) translate([0, 0, flip ? -total_height : 0]) {
        if (simplify) {
            cylinder(d = diameter, h = total_height);
        } else {
            _head_lock();

            cylinder(d = inner_diameter, h = cap_height);

            if (grip_size > 0) {
                cylinder_grip(
                    diameter,
                    cap_height * 2 + head_height,
                    size = grip_size,
                    $fn = 6
                );
            }

            ring(
                diameter = diameter,
                height = total_height,
                thickness = wall
            );

            _spokes();
        }
    }
}

plot = 20 - 1.8;
head_lock_chamfers = [0, .2, .4, .6, .8, 1];

/* .2 through .6 all seem good. .8 works but is a little too loose. */

for (i = [0 : len(head_lock_chamfers) - 1]) {
    translate([plot * i, 0, 0]) {
        trimpot_knob(
            head_lock_chamfer = head_lock_chamfers[i],
            grip_size = 0
        );
    }
}
