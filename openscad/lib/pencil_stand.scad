include <values.scad>;

use <basic_shapes.scad>;
use <utils.scad>;

module pencil_stand(
    wall,
    depth = 20,
    angle_x = 45,
    angle_y = 45,
    $fn = DEFAULT_ROUNDING
) {
    e = 0.0987;

    diameter = PENCIL_STAND_CAVITY_DIAMETER + wall * 2;

    arbitrary_extension = depth * 4;
    total_depth = depth + arbitrary_extension;

    difference() {
        rotate([angle_y, angle_x, 0]) {
            translate([0, 0, -arbitrary_extension]) {
                cylinder(
                    d = diameter,
                    h = total_depth
                );
            }
        }

        translate([-total_depth, -total_depth, -total_depth]) {
            cube([total_depth * 2, total_depth * 2, total_depth]);
        }
    }
}

module pencil_stand_cavity(
    wall,
    depth = 20,
    angle_x = 0,
    angle_y = 45
) {
    pencil_stand(
        wall = 0,
        depth = depth - wall,
        angle_x = angle_x,
        angle_y = angle_y
    );
}

wall = 2;
depth = 40;
angle_x = to_and_from(-60, 60, 30, 3);
angle_y = to_and_from(-60, 60, 0, 1);
difference() {
    pencil_stand(
        wall = wall,
        depth = depth,
        angle_x = angle_x,
        angle_y = angle_y
    );
    translate([0, 0, -.02]) {
        pencil_stand_cavity(
            wall = wall,
            depth = depth,
            angle_x = angle_x,
            angle_y = angle_y
        );
    }
}
