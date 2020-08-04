include <values.scad>;

use <basic_shapes.scad>;

module trimpot_knob(
    diameter = 21,

    cap_height = 1,

    tip_width = 3.8,
    tip_length = .6,
    tip_depth = 0, // in reality it's 1.5 but too small to print

    head_diameter = 6.15,
    head_height = 1.5,
    head_flat_depth = .55,

    body_diameter = 10,

    wall = 1.8,

    grip_size = 1,

    tolerance = .1,

    shim_size = .8,

    $fn = HIDEF_ROUNDING
) {
    e = 0.047;

    total_height = cap_height * 2 + head_height;
    inner_diameter = head_diameter + wall * 2;

    module _head_lock() {
        z = cap_height - e;

        translate([0, 0, z]) {
            ring(
                diameter = diameter,
                height = head_height + e,
                thickness = (diameter - head_diameter) / 2 - tolerance
            );

            cylinder_grip(
                diameter = head_diameter + tolerance * 2,
                height = head_height + e,
                count = 3,
                rotation_offset = 180,
                size = shim_size
            );
        }

        intersection() {
            translate([
                diameter / -2,
                head_diameter / -2 - tolerance * 1 - e,
                z
            ]) {
                cube([
                    diameter,
                    head_flat_depth - tolerance + e,
                    head_height + e,
                ]);
            }

            translate([0, 0, z - e]) {
                cylinder(d = diameter - e * 2, h = head_height + e * 2);
            }
        }

        if (tip_depth > 0) {
            translate([
                tip_width / -2 + tolerance,
                tip_length / -2 + tolerance,
                cap_height - e
            ]) {
                cube([
                    tip_width - tolerance * 2,
                    tip_length - tolerance * 2,
                    tip_depth + e
                ]);
            }
        }
    }

    // This breaks when diameter is narrower than the whole wall + spoke thing
    // TODO: simplify
    module _caps() {
        translate([0, 0, cap_height + head_height - e]) {
            ring(
                diameter = diameter,
                height = cap_height + e,
                thickness = wall
            );
        }

        cylinder(
            d = diameter,
            h = cap_height
        );
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

    difference() {
        union() {
            _head_lock();
            _caps();
            cylinder_grip(
                diameter,
                cap_height * 2 + head_height,
                size = grip_size
            );
        }

        translate([0, 0, -e]) {
            ring(
                diameter = diameter - wall * 2,
                height = total_height + e * 2,
                thickness = ((diameter - wall * 2) - inner_diameter) / 2
            );
        }
    }

    _spokes();
}

trimpot_knob(diameter = 20);
