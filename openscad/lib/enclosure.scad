include <values.scad>;

use <basic_shapes.scad>;
use <hinge_clasp.scad>;

module enclosure_half(
    width, length, height,

    wall = 2.5,
    floor_ceiling = undef,

    add_lip = false,
    remove_lip = false,

    include_hinge = true,
    include_hinge_parts = false,

    hinge_count = undef,
    clasp_count = undef,

    include_clasp = true,

    include_clasp_knob = false,
    hinge_clasp_side = HINGE_CLASP_SIDE_FRONT_BACK,

    just_hinge_parts = false,

    lip = undef,
    lip_height = LIP_BOX_DEFAULT_LIP_HEIGHT,

    radius = 0,

    gutter = 5,
    clasp_end_gutter = undef,
    hinge_end_gutter = undef,

    tolerance = .1,

    $fn = $fn
) {
    e = 0.01234;
    lip = lip != undef ? lip : wall / 2;

    is_left_right_hinge = hinge_clasp_side == HINGE_CLASP_SIDE_LEFT_RIGHT;

    _width = is_left_right_hinge ? length : width;
    _length = is_left_right_hinge ? width : length;

    floor_ceiling = floor_ceiling ? floor_ceiling : wall;
    assumed_total_height = height * 2;

    module _outer_wall() {
        group() {
            difference() {
                rounded_cube(
                    [_width, _length, height + radius],
                    radius,
                    $fn = $fn
                );
                translate([-e, -e, height]) {
                    cube([
                        _width + e * 2,
                        _length + e * 2,
                        radius + e
                    ]);
                }
            }

            if (add_lip) {
                xy = wall - lip + tolerance;

                translate([xy, xy, height - e]) {
                    cube([_width - xy * 2, _length - xy * 2, lip_height + e]);
                }
            }
        }
    }

    module _inner_cutout() {
        translate([wall, wall, floor_ceiling]) {
            cube([
                _width - wall * 2,
                _length - wall * 2,
                height + lip_height + e
            ]);
        }

        if (remove_lip) {
            xy = wall - lip - tolerance;
            z = height - lip_height;

            width = _width - xy * 2;
            length = _length - xy * 2;

            translate([xy, xy, z]) {
                cube([width, length, lip_height + e]);
            }
        }
    }

    module _hinge() {
        hinge_count = hinge_count != undef
            ? hinge_count
            : get_hinge_clasp_count(_width);
        // TODO: fix against radius
        hinge_length = min(assumed_total_height, MINIMUM_HINGE_CLASP_LENGTH);
        hinge_width = HINGE_CLASP_MINIMUM_WIDTH;
        hinge_end_gutter = hinge_end_gutter == undef || hinge_count == 1
            ? ((_width / hinge_count) - hinge_width) / 2
            : hinge_end_gutter;

        availableWidth = (_width - hinge_end_gutter * 2 - hinge_width) /
            max(1, hinge_count - 1);

        for (i = [0 : hinge_count - 1]) {
            position = just_hinge_parts
                ? [i * (hinge_width + gutter), hinge_length, 0]
                : [
                    hinge_end_gutter + i * availableWidth,
                    _length - e,
                    height + hinge_length / 2
                ];

            rotation = just_hinge_parts ? [] : [-90, 0, 0];

            translate(position) rotate(rotation) {
                hinge_clasp(
                    hinge_width, hinge_length,
                    include_pins = false,
                    include_links = include_hinge_parts
                        || just_hinge_parts,
                    include_front_anchor = false,
                    include_back_anchor = !just_hinge_parts,
                    tooth_count = undef
                );
            }
        }
    }

    module _clasp(is_bottom = false) {
        clasp_count = clasp_count != undef
            ? clasp_count
            : get_hinge_clasp_count(_width);

        clasp_width = HINGE_CLASP_MINIMUM_WIDTH;
        // TODO: fix against radius
        clasp_length = min(assumed_total_height, MINIMUM_HINGE_CLASP_LENGTH);

        clasp_end_gutter = clasp_end_gutter == undef || clasp_count == 1
            ? ((_width / clasp_count) - clasp_width) / 2
            : clasp_end_gutter;

        availableWidth = (_width - clasp_end_gutter * 2 - clasp_width) /
            max(1, clasp_count - 1);

        for (i = [0 : clasp_count - 1]) {
            position = just_hinge_parts
                ? [i * (clasp_width + gutter), 0, 0]
                : [
                    clasp_end_gutter + i * availableWidth,
                    e,
                    height - clasp_length / 2
                ];

            translate(position) rotate(just_hinge_parts ? [] : [90, 0, 0]) {
                hinge_clasp(
                    clasp_width,
                    clasp_length,
                    clasp = true,
                    include_clasp = !include_clasp_knob,
                    include_clasp_knob = include_clasp_knob,
                    include_front_anchor = include_hinge_parts
                        || just_hinge_parts,
                    include_back_anchor = !just_hinge_parts && !is_bottom,
                    include_links = include_hinge_parts || just_hinge_parts,
                    flipped = !is_bottom
                );
            }
        }
    }

    module _output() {
        if (just_hinge_parts) {
            _hinge();
            _clasp(true);
        } else {
            difference() {
                group() {
                    difference() {
                        _outer_wall();
                        _inner_cutout();
                    }

                    if (include_hinge) { _hinge(); }
                    if (include_clasp) { _clasp(is_bottom = false); }
                    if (include_clasp_knob) { _clasp(is_bottom = true); }
                }
            }
        }
    }

    translate([is_left_right_hinge ? _length : 0, 0, 0]) {
        rotate([0, 0, is_left_right_hinge ? 90 : 0]) {
            _output();
        }
    }
}

module __test_enclosure_half(
    width = 120,
    length = 90,
    height = 25
) {
    module _(
        add_lip = false,
        remove_lip = true
    ) {
        enclosure_half(
            width = width,
            length = length,
            height = height,

            wall = 3,
            floor_ceiling = undef,

            add_lip = add_lip,
            remove_lip = remove_lip,

            include_hinge = true,
            include_hinge_parts = true,

            hinge_count = 2,
            clasp_count = undef,

            include_clasp = remove_lip,
            include_clasp_knob = add_lip,

            just_hinge_parts = false,

            lip_height = LIP_BOX_DEFAULT_LIP_HEIGHT,

            radius = 2,

            gutter = 5,
            clasp_end_gutter = undef,
            hinge_end_gutter = undef,

            tolerance = .1,

            $fn = 24
        );
    }

    e = .1;
    intersection() {
        union() {
            _(add_lip = true, remove_lip = false);

            translate([width, 0, height * 2 + e]) rotate([0, 180, 0]) {
                _(add_lip = false, remove_lip = true);
            }
        }

        cube([width / 2, length, height * 2]);
    }
}

__test_enclosure_half();
