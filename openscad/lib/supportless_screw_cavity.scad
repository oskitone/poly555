include <values.scad>;

use <basic_shapes.scad>;

module supportless_screw_cavity(
    height = undef,
    span = 10,
    angle = 0,
    diameter = PCB_MOUNT_HOLE_DIAMETER,
    $fn = DEFAULT_ROUNDING,

    // Conservatively larger than needed to ensure layers aren't skipped
    bridge_height = SACRIFICIAL_BRIDGE_HEIGHT * 1.5
) {
    e = .0321;

    if (height != undef) {
        cylinder(
            d = diameter,
            h = height
        );
    }

    rotate([0, 0, angle]) {
        translate([span / -2, diameter / -2, 0]) {
            cube([span, diameter, bridge_height + e]);
        }

        translate([diameter / -2, diameter / -2, bridge_height]) {
            cube([diameter, diameter, bridge_height]);
        }
    }
}

difference() {
    # translate([6 / -2, 8 / -2, 0]) cube([6, 8, 10]);

    translate([0, 0, -.01]) supportless_screw_cavity(
        span = 8 + .01 * 2,
        angle = 90,
        height = 10 + .01 * 2
    );
}
