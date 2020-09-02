include <values.scad>;

use <basic_shapes.scad>;

function get_hinge_clasp_count(
    enclosure_width = 0,
    weight = 3.5,
    minimum = 1
) = (
    max(minimum, floor(enclosure_width / weight / HINGE_CLASP_MINIMUM_WIDTH))
);

module hinge_clasp(
    width, length,

    include_pins = false,
    include_links = true,
    include_front_anchor = true,
    include_back_anchor = true,

    front_back_ratio = .5,

    tooth_count = undef,

    clasp = false,
    include_clasp = true,
    include_clasp_knob = true,
    clasp_latch_rotation = 0,
    fixed_front = false,

    pin_diameter = HINGE_CLASP_DEFAULT_PIN_DIAMETER,

    minimal_support = HINGE_CLASP_DEFAULT_MINIMAL_SUPPORT,

    flipped = false,

    tolerance = .25
) {
    e = 0.0456;

    front_back_ratio = clasp ? .67 : front_back_ratio;
    fixed_front = clasp ? true : fixed_front;

    ideal_tooth_count = round(width / HINGE_CLASP_MINIMUM_TOOTH_WIDTH);
    tooth_count = tooth_count == undef
        ? ideal_tooth_count % 2 == 0
            ? ideal_tooth_count + 1
            : ideal_tooth_count
        : tooth_count;

    pin_hole_diameter = pin_diameter + tolerance * (include_pins ? 3 : 2);

    height = pin_diameter + minimal_support * 2;
    radius = height / 2;

    front_anchor_length = (length - tolerance) * front_back_ratio;
    back_anchor_length = (length - tolerance) * (1 - front_back_ratio);

    tooth_width = width / tooth_count;

    finger_length = height;

    link_count = floor(tooth_count / 2);
    link_length = finger_length * 2 + tolerance;

    module _clasp_knob(cutout = false) {
        depth = HINGE_CLASP_MINIMUM_TOOTH_WIDTH * 1 -
            (cutout ? tolerance * 2 : 0);
        knob_width = width - depth * 2;
        knob_length = front_anchor_length - radius - depth * 1.5;

        module _breakaway_support(x = 0) {
            translate([x, -height + e, 0]) {
                flat_top_rectangular_pyramid(
                    top_width = BREAKAWAY_SUPPORT_DEPTH,
                    top_length = 0,
                    bottom_width = BREAKAWAY_SUPPORT_DEPTH,
                    bottom_length = height,
                    height = height,
                    top_weight_y = 1
                );
            }
        }

        translate([
            (width - knob_width) / 2,
            (front_anchor_length - radius - knob_length) / 2,
            cutout ? -e : 0
        ]) {
            if (cutout) {
                flat_top_rectangular_pyramid(
                    top_width = knob_width,
                    top_length = knob_length,
                    bottom_width = knob_width,
                    bottom_length = knob_length + radius,
                    height = height + e * 2,
                    top_weight_y = 0
                );
            } else {
                cube([knob_width, knob_length, height]);
                _breakaway_support();
                _breakaway_support(knob_width - BREAKAWAY_SUPPORT_DEPTH);
            }
        }
    }

    module _anchors(show_front = true, showBack =true) {
        module _anchor(is_front = true) {
            radius = height / 2;
            anchor_length = is_front ? front_anchor_length : back_anchor_length;
            length = anchor_length - radius;

            is_clasp_handle = clasp && is_front;

            difference() {
                group() {
                    translate(is_front
                        ? [0, 0, 0]
                        : [0, radius, 0]
                    ) {
                        if (is_clasp_handle) {
                            cube([width, length, height]);
                        } else {
                            flat_top_rectangular_pyramid(
                                top_width = width,
                                top_length = radius / 2,

                                bottom_width = width,
                                bottom_length = length,

                                height = height,

                                top_weight_y = !is_front ? 0 : 1
                            );
                        }
                    }

                    translate(is_front
                        ? [0, length, radius]
                        : [0, radius, radius]
                    ) rotate([0, 90, 0]) {
                        cylinder(
                            r = radius,
                            h = width
                        );
                    }

                    translate(is_front
                        ? [0, length, 0]
                        : [0, 0, 0]
                    ) {
                        cube([width, radius, height / 2]);
                    }
                } // group

                link_and_pin_cutout_position = is_front
                    ? [0, 0, 0]
                    : [0, -front_anchor_length, 0];

                if (
                    !is_front ||
                    (is_front && !fixed_front)
                ) {
                    translate(link_and_pin_cutout_position) {
                        _links(for_cutout = true);
                        _pins(for_cutout = true);
                    }
                }
            }
        }

        if (include_front_anchor && show_front) {
            _anchor(is_front = true);
        }

        if (include_back_anchor && showBack) {
            translate([0, front_anchor_length + tolerance, 0]) {
                _anchor(is_front = false);
            }
        }

        if (!include_front_anchor && !include_back_anchor) {
            cube([0,0,0]);
        }
    }

    module _pins(for_cutout = false) {
        module _pin() {
            translate([for_cutout ? -e : 0, 0, height / 2]) {
                rotate([0, 90, 0]) {
                    cylinder(
                        d = for_cutout ? pin_hole_diameter : pin_diameter,
                        h = for_cutout ? width + e * 2 : width,
                        $fn = 12
                    );
                }
            }
        }

        min_y = length * front_back_ratio - finger_length / 2 - tolerance / 2;
        max_y = length * front_back_ratio + finger_length / 2 + tolerance / 2;
        for (y = [max_y, min_y]) {
            translate([0, y, 0]) {
                _pin();
            }
        }
    }

    module _links(for_cutout = false) {
        module _link(dimensions) {
            module _c() {
                rotate([0, 90, 0]) {
                    cylinder(h = dimensions[0], r = radius);
                }
            }

            hull() {
                translate([0, radius, radius]) _c();
                translate([0, dimensions[1] - radius, radius]) _c();
            }
        }

        difference() {
            group() {
                for (i = [0 : link_count - 1]) {
                    x = (i * tooth_width * 2) + tooth_width;
                    y = length * front_back_ratio - link_length / 2;

                    dimensions = [
                        for_cutout ? tooth_width + tolerance * 2 : tooth_width,
                        for_cutout ? link_length + tolerance * 4 : link_length,
                        for_cutout ? height + e * 2 : height
                    ];

                    translate([
                        for_cutout ? x - tolerance : x,
                        for_cutout ? y - tolerance * 2 : y,
                        for_cutout ? -e : 0
                    ]) {
                        if (!for_cutout) {
                            _link(dimensions);
                        } else {
                            cube(dimensions);
                        }
                    }
                }
            }

            _pins(for_cutout = !for_cutout);
        }
    }

    module _output() {
        _anchors(show_front = !clasp);

        rotation_adjustment_y = front_anchor_length + finger_length / 2 + tolerance;
        rotation_adjustment_z = height / 2;
        translate([0, rotation_adjustment_y, rotation_adjustment_z])
        rotate([clasp ? -clasp_latch_rotation : 0, 0, 0])
        translate([0, -rotation_adjustment_y, -rotation_adjustment_z])

        if (!clasp || include_clasp) {
            difference() {
                group() {
                    if (include_links) { _links(); }
                    if (include_pins) { _pins(); }
                    if (clasp) { _anchors(showBack = false); }
                    cube([0,0,0]); // prevent difference error
                }

                if (clasp) {
                    _clasp_knob(cutout = true);

                    grip_width = HINGE_CLASP_MINIMUM_TOOTH_WIDTH * 2;
                    grip_length = HINGE_CLASP_MINIMUM_TOOTH_WIDTH * .25;
                    grip_height = height * .5;

                    translate([(width - grip_width) / 2, -e, -e]) {
                        cube([
                            grip_width,
                            grip_length + e,
                            grip_height + e
                        ]);
                    }
                }
            }
        }

        if (clasp && include_clasp_knob) {
            _clasp_knob(cutout = false);
        }
    }

    translate([0, length / 2, 0])
    mirror([0, flipped ? 1 : 0, 0])
    translate([0, length / -2, 0]) {
        _output();
    }
}

hinge_clasp(
    width = 100, length = 30,

    include_pins = false,
    include_links = true,
    include_front_anchor = true,
    include_back_anchor = true,

    front_back_ratio = 1,

    tooth_count = undef,

    clasp = false,
    include_clasp_knob = true,
    clasp_latch_rotation = 0,
    fixed_front = false,

    pin_diameter = HINGE_CLASP_DEFAULT_PIN_DIAMETER,

    minimal_support = HINGE_CLASP_DEFAULT_MINIMAL_SUPPORT,

    flipped = false,

    tolerance = .25
);

translate([0, 50, 0])
hinge_clasp(
    width = 20, length = 20,

    include_pins = false,
    include_links = true,
    include_front_anchor = true,
    include_back_anchor = true,

    front_back_ratio = .5,

    tooth_count = undef,

    clasp = true,
    include_clasp = true,
    include_clasp_knob = true,
    clasp_latch_rotation = 90,
    fixed_front = false,

    pin_diameter = HINGE_CLASP_DEFAULT_PIN_DIAMETER,

    minimal_support = HINGE_CLASP_DEFAULT_MINIMAL_SUPPORT,

    flipped = false,

    tolerance = .25
);
