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

module flat_top_rectangular_pyramid(
    top_width = 0,
    top_length = 0,

    bottom_width = 0,
    bottom_length = 0,

    height = 0,

    top_x = undef,
    top_y = undef,

    top_weight_x = .5,
    top_weight_y = .5
) {
    top_x = top_x != undef
        ? top_x
        : (bottom_width - top_width) * top_weight_x;
    top_y = top_y != undef
        ? top_y
        : (bottom_length - top_length) * top_weight_y;

    max_difference = max(bottom_width - top_width, bottom_length - top_length);
    height = height == undef
        ? max_difference / 2
        : height;

    polyhedron(
        [
            [0, 0, 0],
            [bottom_width, 0, 0],
            [bottom_width, bottom_length, 0],
            [0, bottom_length, 0],
            [top_x, top_y, height],
            [top_width + top_x, top_y, height],
            [top_width + top_x, top_length + top_y, height],
            [top_x, top_length + top_y, height]
        ], [
            [0, 1, 2, 3],
            [4, 5, 1, 0],
            [7, 6, 5, 4],
            [5, 6, 2, 1],
            [6, 7, 3, 2],
            [7, 4, 0, 3]
        ]
    );
}

module rounded_cube(dimensions, radius, $fn = $fn) {
    positions = [
        [radius, radius, radius],
        [dimensions.x - radius, radius, radius],
        [dimensions.x - radius, dimensions.y - radius, radius],
        [radius, dimensions.y - radius, radius],
        [radius, radius, dimensions.z - radius],
        [dimensions.x - radius, radius, dimensions.z - radius],
        [dimensions.x - radius, dimensions.y - radius, dimensions.z - radius],
        [radius, dimensions.y - radius, dimensions.z - radius],
    ];

    if (radius > 0) {
        hull() {
            for (position = positions) {
                translate(position) sphere(r = radius);
            }
        }
    } else {
        cube(dimensions);
    }
}

module support_wall(
    dimensions,
    is_back = true,
    railing_diameter = 3.5,
    support_width = 2,
    support_length = 4,
    gutter = 4
) {
    railing_z = railing_diameter / 4;

    module _support(height = dimensions[2], depth = support_length) {
        translate([0, -depth, 0]) {
            flat_top_rectangular_pyramid(
                top_width = support_width,
                top_length = 0,
                bottom_width = support_width,
                bottom_length = support_length,
                height = height,
                top_weight_y = 1
            );
        }
    }

    translate(is_back ? [0, dimensions[1], 0] : [0, 0, 0]) {
        mirror(is_back ? [0, 1, 0] : [0, 0, 0]) {
            cube(dimensions);

            translate([0, dimensions[1] / 2, dimensions[2] + railing_z]) {
                rotate([0, 90, 0]) {
                    cylinder(
                        d = railing_diameter,
                        h = dimensions[0],
                        $fn = 9
                    );
                }
            }

            translate([gutter, 0, 0]) {
                _support();
            }
            translate([dimensions[0] - support_length - gutter, 0, 0]) {
                _support();
            }
        }
    }
}
