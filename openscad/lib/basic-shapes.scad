module hole_array(xs, diameter, height, y = 0, z = 0) {
    for (x = xs) {
        translate([x, y, z]) {
            cylinder(
                d = diameter,
                h = height
            );
        }
    }
}
