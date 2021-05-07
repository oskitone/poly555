include <values.scad>;

use <supportless_screw_cavity.scad>;

module screw_head_exposure(
    tolerance = 0,
    clearance = 0,
    show_dfm = true,
    $fn = HIDEF_ROUNDING
) {
    e = .0582;

    diameter = SCREW_HEAD_DIAMETER + tolerance * 2;
    height = SCREW_HEAD_HEIGHT + clearance + e;

    module _chamfer(chamfer = 1, $fn = DEFAULT_ROUNDING) {
        cylinder(
            d1 = diameter + chamfer * 2,
            d2 = diameter,
            h = chamfer
        );
    }

    translate([0, 0, -e]) {
        cylinder(d = diameter, h = height);
        _chamfer();
    }

    if (show_dfm) {
        translate([0, 0, SCREW_HEAD_HEIGHT + clearance - e]) {
            supportless_screw_cavity(
                span = diameter,
                diameter = PCB_MOUNT_HOLE_DIAMETER + tolerance * 2
            );
        }
    }
}

module screw_head_exposures(
    positions = [],

    tolerance = 0,
    clearance = 0,

    $fn = HIDEF_ROUNDING
) {
    for (p = positions) {
        translate([p.x, p.y, 0]) {
            screw_head_exposure(
                tolerance = tolerance,
                clearance = clearance,

                $fn = HIDEF_ROUNDING
            );
        }
    }
}
