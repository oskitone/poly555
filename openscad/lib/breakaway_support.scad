include <values.scad>;

use <basic_shapes.scad>;

module breakaway_support(
    width = BREAKAWAY_SUPPORT_DEPTH,
    length = BREAKAWAY_SUPPORT_DEPTH,
    height = BREAKAWAY_SUPPORT_DEPTH,
    foot = .4
) {
    cube([width, length, height]);

    translate([-foot, -foot, 0]) {
        flat_top_rectangular_pyramid(
            top_width = width,
            top_length = length,
            bottom_width = width + foot * 2,
            bottom_length = length + foot * 2,
            height = foot
        );
    }
}
