include <values.scad>;

use <basic_shapes.scad>;

module breakaway_support(
    width = BREAKAWAY_SUPPORT_DEPTH,
    length = BREAKAWAY_SUPPORT_DEPTH,
    height = BREAKAWAY_SUPPORT_DEPTH,
    flip_vertically = false,
    include_first = true,
    include_last = true
) {
    has_width = width != BREAKAWAY_SUPPORT_DEPTH;
    has_length = length != BREAKAWAY_SUPPORT_DEPTH;

    assert(has_width || has_length, "Supply either a width or length");

    module _wall() {
        span = max(width, length);
        count = ceil(
            (span - BREAKAWAY_SUPPORT_DEPTH) / BREAKAWAY_SUPPORT_DISTANCE
        );

        x_plot = has_width ? (span - BREAKAWAY_SUPPORT_DEPTH) / count : 0;
        y_plot = has_length ? (span - BREAKAWAY_SUPPORT_DEPTH) / count : 0;

        start = include_first ? 0 : 1;
        end = include_last ? count : count - 1;

        for (i = [start : end]) {
            translate([x_plot * i, y_plot * i, 0]) {
                cube([BREAKAWAY_SUPPORT_DEPTH, BREAKAWAY_SUPPORT_DEPTH, height]);
            }
        }

        translate([
            0,
            0,
            flip_vertically ? 0 : height - SACRIFICIAL_BRIDGE_HEIGHT
        ]) {
            cube([width, length, SACRIFICIAL_BRIDGE_HEIGHT]);
        }
    }

    translate([
        width == BREAKAWAY_SUPPORT_DEPTH ? BREAKAWAY_SUPPORT_DEPTH / -2 : 0,
        length == BREAKAWAY_SUPPORT_DEPTH ? BREAKAWAY_SUPPORT_DEPTH / -2 : 0,
        0
    ]) {
        _wall();
    }
}

spans = [2, 5, 10, 15, 25];
height = 5;
plot = 2;
for (i = [0 : len(spans) - 1]) {
    translate([plot * i, 0, 0]) {
        breakaway_support(
            length = spans[i],
            height = height,
            flip_vertically = i % 2 == 0
        );
    }
}
