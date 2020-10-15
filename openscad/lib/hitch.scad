include <values.scad>;

use <basic_shapes.scad>;
use <dovetails.scad>;
use <utils.scad>;

module hitch(
    width,
    height = HITCH_HEIGHT,
    bottom_extension = 0,
    dovetail_wall = HITCH_DOVETAIL_WALL,
    include_dovetails = true,
    tolerance = .1 / 2
) {
    e = 0.007;
    length = HITCH_WALL_LENGTH - tolerance * 2;

    translate([0, tolerance, -bottom_extension]) {
        cube([
            width,
            length,
            height - HITCH_HEAD_HEIGHT + bottom_extension + e
        ]);

        translate([0, 0, height - HITCH_HEAD_HEIGHT + bottom_extension]) {
            cube([width, HITCH_HEAD_LENGTH - tolerance * 2, HITCH_HEAD_HEIGHT]);
        }
    }

    if (include_dovetails) {
        dovetail_length = length - tolerance * 2 - dovetail_wall;

        translate([
            0,
            length - dovetail_length + tolerance,
            -bottom_extension - HITCH_DOVETAIL_HEIGHT
        ]) {
            dovetails([
                width,
                dovetail_length,
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
    tolerance = .1 / 2
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

module animated_demo() {
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
}

module hitch_base(
    width,
    dovetail_wall = HITCH_DOVETAIL_WALL,
    tolerance = .1 / 2
) {
    e = 0.007;
    length = HITCH_WALL_LENGTH - tolerance * 2;

    translate([0, tolerance, 0]) {
        dovetails([
            width,
            length,
            HITCH_DOVETAIL_HEIGHT
        ], show_base = true);
    }

    translate([0, tolerance, 0]) {
        cube([width, dovetail_wall, HITCH_DOVETAIL_HEIGHT]);
    }
}

translate([0, 0, HITCH_DOVETAIL_HEIGHT]) {
    render() hitch(width = 50);
}
# render() hitch_base(width = 50);
