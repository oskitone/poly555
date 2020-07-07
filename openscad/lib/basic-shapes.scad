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
