module diagonal_grill(
    width, length, height,
    size = 2,
    angle = 45
) {
    e = 0.0049;
    plot_width = size * 2;

    long_side = max(width, length);

    module _cavities() {
        translate([width / 2, length / 2, 0 ]) {
            rotate([0, 0, angle]) {
                translate([-long_side, -long_side, 0]) {
                    for (i = [0 : long_side / plot_width * 2 - 1]) {
                        x = plot_width * i;
                        y = 0;

                        translate([x, y, -e]) {
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

diagonal_grill(80, 40, 6, size = 3, angle = 360 * $t);
