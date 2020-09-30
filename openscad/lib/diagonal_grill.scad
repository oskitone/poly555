module diagonal_grill(
    width, length, height,
    size = 2,
    angle = 45
) {
    e = 0.0049;
    plot_width = size * 2;

    long_side = max(width, length);

    module _cavities() {
        count = floor(long_side / plot_width * 2) + 1;
        total_width = (count * 2 - 1) * size;

        translate([width / 2, length / 2, 0 ]) {
            rotate([0, 0, angle]) {
                translate([total_width / -2, total_width / -2, 0]) {
                    for (i = [0 : count - 1]) {
                        translate([plot_width * i, 0, -e]) {
                            cube([size, long_side * 2, height + e * 2]);
                        }
                    }
                }
            }
        }
    }

    difference() {
        cube([width, length, height]);
        _cavities();
    }
}

translate([-40, -20, 0]) {
    # cube([80, 40, 5]);
    diagonal_grill(80, 40, 6, size = 9, angle = 360 * $t);
}
