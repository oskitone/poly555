include <values.scad>;

use <basic_shapes.scad>;
use <dovetails.scad>;
use <utils.scad>;

HITCH_HEAD_LENGTH = 5;
HITCH_HEAD_HEIGHT = 2;

HITCH_WALL_LENGTH = 3;

HITCH_HEIGHT = 10;

HITCH_DOVETAIL_HEIGHT = 3;

module hitch(
    width,
    height = HITCH_HEIGHT,
    bottom_extension = 0,
    include_dovetails = true,
    tolerance = .1
) {
    e = 0.007;

    translate([0, tolerance, -bottom_extension]) {
        cube([
            width,
            HITCH_WALL_LENGTH - tolerance * 2,
            height - HITCH_HEAD_HEIGHT + bottom_extension + e
        ]);

        translate([0, 0, height - HITCH_HEAD_HEIGHT + bottom_extension]) {
            cube([width, HITCH_HEAD_LENGTH - tolerance * 2, HITCH_HEAD_HEIGHT]);
        }
    }

    if (include_dovetails) {
        translate([0, tolerance, -bottom_extension - HITCH_DOVETAIL_HEIGHT]) {
            dovetails([
                width,
                HITCH_WALL_LENGTH - tolerance * 2,
                HITCH_DOVETAIL_HEIGHT + e
            ], show_insert = true);
        }
    }
}

module hitch_cavity(
    width,
    height = HITCH_HEIGHT,
    head_clearance = 1,
    bottom_extension = 0,
    tolerance = .1
) {
    e = .0035;

    translate([
        -e,
        HITCH_WALL_LENGTH - HITCH_HEAD_LENGTH - tolerance,
        -bottom_extension
    ]) {
        cube([
            width + e * 2,
            HITCH_HEAD_LENGTH + tolerance * 2,
            height + bottom_extension + head_clearance
        ]);
    }

    translate([
        -e,
        0,
        height - HITCH_HEAD_HEIGHT
    ]) {
        cube([
            width + e * 2,
            HITCH_HEAD_LENGTH + tolerance * 2,
            HITCH_HEAD_HEIGHT + head_clearance
        ]);
    }
}

travel_y = HITCH_HEAD_LENGTH - HITCH_WALL_LENGTH;
travel_z = HITCH_HEIGHT;
step_weights = [travel_z, travel_y, travel_y, travel_z];

step_i = get_step_end_indexes_above_t($t, get_step_ends(step_weights))[0];
step_t = get_step_t(step_i, $t, get_step_ends(step_weights));

translate([
    0,
    (step_i == 0 || step_i == 3)
        ? HITCH_WALL_LENGTH - HITCH_HEAD_LENGTH
        : step_i == 1
            ? (HITCH_WALL_LENGTH - HITCH_HEAD_LENGTH) * (1 - step_t)
            : (HITCH_WALL_LENGTH - HITCH_HEAD_LENGTH) * (step_t),
    step_i == 0
        ? (-HITCH_HEIGHT + .1) * (1 - step_t)
        : step_i == 3 ? (-HITCH_HEIGHT + .1) * step_t : 0
]) {
    render() hitch(30, HITCH_HEIGHT);
}

# render() difference() {
    translate([10, -10, .001]) cube([15, 20, 15]);
    hitch_cavity(30, HITCH_HEIGHT);
}
