include <values.scad>;

use <pcb.scad>;

module mount_stilt(
    height,

    width = NUT_DIAMETER + 4,
    length = NUT_DIAMETER,

    ceiling = 2,

    hole_diameter = PCB_MOUNT_HOLE_DIAMETER,
    nut_lock_diameter = NUT_DIAMETER + .5,
    nut_lock_height = NUT_HEIGHT + .5,

    include_sacrificial_bridge = true,
    sacrificial_bridge_height = .2
) {
    e = 0.00987;

    assert(height > nut_lock_height + ceiling, "mount_stilt too short");

    difference() {
        translate([width / -2, length / -2, 0]) {
            cube([width, length, height]);
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
            cube([width, length, sacrificial_bridge_height]);
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

color("purple", .25) pcb();
mount_stilts(
    positions = PCB_HOLES,
    height = 10,
    z = -10
);
