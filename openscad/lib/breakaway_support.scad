include <values.scad>;

use <basic_shapes.scad>;

module breakaway_support(
    width = BREAKAWAY_SUPPORT_DEPTH,
    length = BREAKAWAY_SUPPORT_DEPTH,
    height = BREAKAWAY_SUPPORT_DEPTH,
    flip_vertically = false,
    include_first = true,
    include_last = true,
    support_depth = BREAKAWAY_SUPPORT_DEPTH,
    bridge_height = SACRIFICIAL_BRIDGE_HEIGHT
) {
    support_depth = max(BREAKAWAY_SUPPORT_DEPTH, support_depth);
    width = max(width, support_depth);
    length = max(length, support_depth);
    height = max(height, support_depth);

    has_width = width != support_depth;
    has_length = length != support_depth;

    assert(has_width || has_length, "Supply either a width or length");

    module _wall() {
        span = max(width, length);
        count = ceil((span - support_depth) / BREAKAWAY_SUPPORT_DISTANCE);

        x_plot = has_width ? (span - support_depth) / count : 0;
        y_plot = has_length ? (span - support_depth) / count : 0;

        start = include_first ? 0 : 1;
        end = include_last ? count : count - 1;

        for (i = [start : end]) {
            translate([x_plot * i, y_plot * i, 0]) {
                cube([support_depth, support_depth, height]);
            }
        }

        translate([0, 0, flip_vertically ? 0 : height - bridge_height]) {
            cube([width, length, bridge_height]);
        }
    }

    translate([
        width == support_depth ? support_depth / -2 : 0,
        length == support_depth ? support_depth / -2 : 0,
        0
    ]) {
        _wall();
    }
}

spans = [2, 5, 10, 15, 25];
height = 5;
plot = 4;
for (i = [0 : len(spans) - 1]) {
    translate([plot * i, 0, 0]) {
        breakaway_support(
            support_depth = BREAKAWAY_SUPPORT_DEPTH * (i + 1),
            length = spans[i],
            height = height,
            flip_vertically = i % 2 == 0
        );
    }
}

module overhang_support(
    width,
    length,
    support_depth = BREAKAWAY_SUPPORT_DEPTH,
    bridge_height = SACRIFICIAL_BRIDGE_HEIGHT
) {
    count = ceil((width - support_depth) / BREAKAWAY_SUPPORT_DISTANCE);
    plot = (width - support_depth) / count;

    e = .0041;

    for (i = [0 : count]) {
        translate([i * plot, 0, -length]) {
            flat_top_rectangular_pyramid(
                top_width = support_depth,
                top_length = length,
                bottom_width = support_depth,
                bottom_length = 0,
                height = length - bridge_height,
                top_weight_y = 0
            );
        }
    }

    if (bridge_height > 0) {
        translate([0, length - support_depth, -bridge_height - e]) {
            cube([width, support_depth, bridge_height + e * 2]);
        }
    }
}
