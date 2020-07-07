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

    hull() {
        for (position = positions) {
            translate(position) sphere(r = radius);
        }
    }
}

module rounded_cube_cutout(dimensions, radius) {
    e = 0.05678;

    width = dimensions[0] + e * 2;
    length = dimensions[1] + e * 2;
    height = dimensions[2] + e * 2;

    translate([-e, -e, -e]) {
        difference() {
            cube([width, length, height]);

            translate([-e, -e, -e]) {
                rounded_cube(
                    [
                        width + e * 2,
                        length + e * 2,
                        height + e * 2
                    ],
                    radius = radius
                );
            }
        }
    }
}
