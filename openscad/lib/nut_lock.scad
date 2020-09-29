include <values.scad>;

module nut_lock(
    diameter_clearance = DEFAULT_NUT_LOCK_DIAMETER_CLEARANCE,
    height_clearance = DEFAULT_NUT_LOCK_HEIGHT_CLEARANCE
) {
    translate([
        NUT_DIAMETER / -2 - diameter_clearance,
        NUT_DIAMETER / -2 - diameter_clearance,
        0
    ]) {
        cube([
            NUT_DIAMETER + diameter_clearance * 2,
            NUT_DIAMETER + diameter_clearance * 2,
            NUT_HEIGHT + height_clearance * 2
        ]);
    }
}

nut_lock();
