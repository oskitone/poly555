include <values.scad>;

use <supportless_screw_cavity.scad>;

module nut_lock(
    diameter_clearance = DEFAULT_NUT_LOCK_DIAMETER_CLEARANCE,
    height_clearance = DEFAULT_NUT_LOCK_HEIGHT_CLEARANCE,
    hole_diameter = PCB_MOUNT_HOLE_DIAMETER,

    include_supportless_screw_cavity = false,
    supportless_screw_cavity_angle = 0,
    flip_supportless_screw_cavity = false
) {
    e = .0123;
    x_y = NUT_DIAMETER / -2 - diameter_clearance;

    width_length = NUT_DIAMETER + diameter_clearance * 2;
    height = NUT_HEIGHT + height_clearance * 2;

    translate([x_y, x_y, 0]) {
        cube([width_length, width_length, height]);
    }

    if (include_supportless_screw_cavity) {
        z = flip_supportless_screw_cavity ? e : height - e;

        translate([0, 0, z]) {
            mirror([0, 0, flip_supportless_screw_cavity ? 1 : 0]) {
                supportless_screw_cavity(
                    span = width_length,
                    angle = supportless_screw_cavity_angle,
                    diameter = hole_diameter
                );
            }
        }
    }
}

nut_lock();
