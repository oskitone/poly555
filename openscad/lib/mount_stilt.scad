include <values.scad>;

use <basic_shapes.scad>;
use <pcb.scad>;

module mount_stilt(
    height,

    width = NUT_DIAMETER + 4,
    length = NUT_DIAMETER,

    ceiling = 2,

    hole_diameter = PCB_MOUNT_HOLE_DIAMETER,
    nut_lock_diameter = NUT_DIAMETER + .5,
    nut_lock_height = NUT_HEIGHT + .4,

    // TODO: obviate
    include_sacrificial_bridge = true,

    include_pedestal = false,

    $fn = DEFAULT_ROUNDING
) {
    e = 0.00987;

    assert(height >= nut_lock_height + ceiling, "mount_stilt too short");

    difference() {
        translate([width / -2, length / -2, 0]) {
            cube([width, length, height]);

            if (include_pedestal) {
                translate([0, -nut_lock_diameter, 0]) {
                    flat_top_rectangular_pyramid(
                        top_width = width,
                        top_length = length,

                        bottom_width = width,
                        bottom_length = length + nut_lock_diameter * 2,

                        height = height - nut_lock_height - ceiling,

                        top_x = undef,
                        top_y = undef,

                        top_weight_x = .5,
                        top_weight_y = .5
                    );
                }
            }
        }

        translate([0, 0, -e]) {
            cylinder(
                h = height + e * 2,
                d = hole_diameter
            );
        }

        translate([
            nut_lock_diameter / -2,
            length / -2 - e,
            height - nut_lock_height - ceiling
        ]) {
            cube([
                NUT_DIAMETER,
                NUT_DIAMETER + e * 2,
                nut_lock_height
            ]);
        }
    }

    if (include_sacrificial_bridge) {
        translate([width / -2, length / -2, height - ceiling]) {
            cube([width, length, SACRIFICIAL_BRIDGE_HEIGHT]);
        }
    }
}

module mount_stilts(
    positions,
    height,
    z = 0
) {
    for (p = positions) {
        translate([p.x, p.y, z]) {
            mount_stilt(height);
        }
    }
}

plot = NUT_DIAMETER + 4;
height_adjustments = [0, .1, .2, .3, .4, .5, .6, .7];

for (i = [0 : len(height_adjustments) - 1]) {
    translate([plot * i, 0, 0]) {
        mount_stilt(
            width = plot,
            height = 8,
            nut_lock_height = NUT_HEIGHT + height_adjustments[i]
        );
    }
}
