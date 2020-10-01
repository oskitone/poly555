include <values.scad>;

use <basic_shapes.scad>;

module dovetails(
    dimensions = [],
    show_base = false,
    show_insert = false,
    invert = false,
    tolerance = .1
) {
    width = dimensions[0];
    length = dimensions[1];
    height = dimensions[2];

    e = .023;

    MINIMUM_TAB_WIDTH = 5;

    _tab_count = floor(width / MINIMUM_TAB_WIDTH) - 2;
    tab_count = _tab_count % 1 == 0 ? _tab_count - 1 : _tab_count;

    depth = height * (invert ? -1 : 1);

    end_width = width / (tab_count + 2) - depth / 4;
    tab_width = (width - end_width * 2) / tab_count;

    module _tabs(width = tab_width, length = length, height = height) {
        for (i = [0 : tab_count - 1]) {
            x = end_width + i * tab_width - depth / 4 + (tab_width - width) / 2;

            if (i % 2 == 0) {
                translate([x, 0, 0]) {
                    flat_top_rectangular_pyramid(
                        top_width = width - depth / 2,
                        top_length = length,
                        bottom_width = width + depth / 2,
                        bottom_length = length,
                        height = height
                    );
                }
            }
        }
    }

    if (show_insert) {
        _tabs(width = tab_width - tolerance * 2);
    }

    if (show_base) {
        difference() {
            cube([width, length, height]);

            translate([0, -e, -e]) {
                _tabs(
                    width = tab_width + tolerance * 2,
                    length = length + e * 2,
                    height = height + e * 2
                );
            }
        }
    }
}

dovetails([60, 10, 4], show_base = true);
# dovetails([60, 10, 4], show_insert = true);
