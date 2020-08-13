include <values.scad>;

use <basic_shapes.scad>;

module hitch(
    width,
    height,

    head_bleed = 0,
    y_bleed = 0,

    mount_hole_xs = [],

    mount_hole_diameter = PCB_MOUNT_HOLE_DIAMETER + .4,
    mount_screw_head_diameter = SCREW_HEAD_DIAMETER,
    mount_screw_head_height = SCREW_HEAD_HEIGHT,
    mount_screw_head_clearance = HITCH_DEFAULT_MOUNT_SCREW_HEAD_CLEARANCE,

    screw_floor = HITCH_DEFAULT_SCREW_FLOOR,

    flatten_front = false,

    $fn = DEFAULT_ROUNDING
) {
    e = 0.007;
    head_wall = 1;
    minimum_wall = .1;

    head_length = mount_screw_head_diameter + head_wall * 2 + y_bleed * 2;
    head_height = mount_screw_head_height + mount_screw_head_clearance
        + head_bleed;
    arm_length = mount_hole_diameter + minimum_wall * 2 + y_bleed * 2;
    chamfer_height = (head_length - arm_length) / 2;
    arm_height = height - head_height + head_bleed - screw_floor - chamfer_height * 2;

    module _mount_holes() {
        hole_array(
            mount_hole_xs,
            mount_hole_diameter,
            height + e * 2,
            0,
            -e
        );
        hole_array(
            mount_hole_xs,
            mount_screw_head_diameter,
            head_height + e,
            0,
            height - head_height + head_bleed
        );
    }

    module _arm() {
        translate([0, arm_length / -2, chamfer_height]) {
            cube([width, arm_length, arm_height + e]);
        }
    }

    module _chamfer(top_length, bottom_length, z) {
        translate([0, bottom_length / -2, z]) {
            flat_top_rectangular_pyramid(
                top_width = width,
                top_length = top_length,
                bottom_width = width,
                bottom_length = bottom_length,
                height = chamfer_height + e
            );
        }
    }

    module _head() {
        translate([0, head_length / -2, arm_height + chamfer_height * 2 + screw_floor]) {
            cube([width, head_length, head_height]);
        }
    }

    module _screw_floor() {
        translate([0, head_length / -2, arm_height + chamfer_height * 2]) {
            cube([width, head_length, screw_floor]);
        }
    }

    module _flat_front() {
        head_length_without_bleed = mount_screw_head_diameter + head_wall * 2;
        translate([0, arm_length / 2 - head_length_without_bleed, 0]) {
            cube([width, head_length_without_bleed, height + head_bleed]);
        }
    }

    /* DEBUG */
    /* # translate([0, head_length / -2, 0]) cube([width, head_length, height + head_bleed]); */

    difference() {
        union() {
            _chamfer(arm_length, head_length, 0);
            _arm();
            _chamfer(head_length, arm_length, chamfer_height + arm_height);
            _head();
            _screw_floor();
            if (flatten_front) {
                _flat_front();
            }
        }

        _mount_holes();
    }
}

hitch(
    width = 30,
    height = 10,
    head_bleed = 0,
    y_bleed = .1 * -2, // tolerance
    mount_hole_xs = [5, 25],
    flatten_front = true
);
