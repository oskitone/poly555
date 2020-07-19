include <values.scad>;

use <basic_shapes.scad>;

module pencil_stand(
    wall,
    depth = 20,
    angle = 45,
    $fn = DEFAULT_ROUNDING
) {
    e = 0.0987;

    abs_angle = abs(angle);

    diameter = PENCIL_STAND_CAVITY_DIAMETER + wall * 2;
    radius = diameter / 2;

    extension = abs_angle < 90 ? tan(abs_angle) * radius : 0;
    total_depth = depth + extension;

    y = radius / cos(abs_angle);
    z = cos(90 - abs_angle) * diameter;

    length = sin(abs_angle) * total_depth + cos(abs_angle) * diameter;
    height = cos(abs_angle) * total_depth;

    mirror([0, angle < 0 ? 1 : 0, 0]) {
        intersection() {
            rotate([-abs_angle, 0, 0]) {
                translate([0, 0, -extension]) {
                    cylinder(
                        d = diameter,
                        h = total_depth
                    );
                }
            }

            translate([-radius - e, -y - e, 0]) {
                cube([diameter + e * 2, length + e * 2, height + e]);
            }
        }
    }
}

module pencil_stand_cavity(
    wall,
    depth = 20,
    angle = 45
) {
    pencil_stand(0, depth - wall, angle);
}

intersection() {
    wall = 2;
    depth = 20;
    angle = abs($t - .5) * 2 * 89;

    difference() {
        pencil_stand(wall, depth, angle);
        translate([0, 0, -.002]) pencil_stand_cavity(wall, depth, angle);
    }

    translate([0, depth * -2, 0]) cube([depth * 4, depth * 4, depth * 2]);
}
