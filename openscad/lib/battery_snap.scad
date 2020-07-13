include <values.scad>;

use <basic_shapes.scad>;
use <battery.scad>;

module battery_snap(
    wall_width = BATTERY_WIDTH * .75,
    wall_length = 2,
    showFrontWall = true,
    showBackWall = true,
    tolerance = 0,
) {
    x = (BATTERY_WIDTH - wall_width) / 2;

    translate([x, -tolerance - wall_length, 0]) {
        if (showFrontWall) {
            support_wall(
                [wall_width, wall_length, BATTERY_HEIGHT],
                is_back = false
            );
        }
    }
    translate([x, BATTERY_LENGTH + tolerance, 0]) {
        if (showBackWall) {
            support_wall(
                [wall_width, wall_length, BATTERY_HEIGHT],
                is_back = true
            );
        }
    }
}

% battery();
battery_snap(tolerance = 1);
