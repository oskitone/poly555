include <values.scad>;

use <basic_shapes.scad>;
use <pcb.scad>;
use <nut_lock.scad>;
use <supportless_screw_cavity.scad>;

module mount_stilt(
    height,

    width = NUT_DIAMETER + 4,
    length = NUT_DIAMETER,

    ceiling = 2,

    hole_diameter = PCB_MOUNT_HOLE_DIAMETER,

    nut_lock_height_clearance = DEFAULT_NUT_LOCK_HEIGHT_CLEARANCE,
    nut_lock_diameter_clearance = DEFAULT_NUT_LOCK_DIAMETER_CLEARANCE,

    include_pedestal = true,

    $fn = DEFAULT_ROUNDING
) {
    e = 0.00987;
    nut_lock_height = NUT_HEIGHT + nut_lock_height_clearance * 2;

    assert(height >= nut_lock_height + ceiling, "mount_stilt too short");

    difference() {
        translate([width / -2, length / -2, 0]) {
            cube([width, length, height]);

            if (include_pedestal) {
                translate([0, -NUT_DIAMETER, 0]) {
                    flat_top_rectangular_pyramid(
                        top_width = width,
                        top_length = length,

                        bottom_width = width,
                        bottom_length = length + NUT_DIAMETER * 2,

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

        translate([0, 0, height - nut_lock_height - ceiling]) {
            nut_lock(
                height_clearance = nut_lock_height_clearance,
                diameter_clearance = nut_lock_diameter_clearance,
                include_supportless_screw_cavity = true,
                hole_diameter = hole_diameter
            );
        }
    }
}

module mount_stilts(
    positions,
    height,
    z = 0,
    hole_diameter = PCB_MOUNT_HOLE_DIAMETER
) {
    for (p = positions) {
        translate([p.x, p.y, z]) {
            mount_stilt(height, hole_diameter = hole_diameter);
        }
    }
}

mount_stilt(
    width = 8,
    height = 8
);
