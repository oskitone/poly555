include <lib/values.scad>;

use <lib/basic_shapes.scad>;
use <lib/battery.scad>;
use <lib/diagonal_grill.scad>;
use <lib/enclosure.scad>;
use <lib/engraving.scad>;
use <lib/keys.scad>;
use <lib/mount_stilt.scad>;
use <lib/mounting_rail.scad>;
use <lib/pcb.scad>;
use <lib/speaker.scad>;
use <lib/switch.scad>;
use <lib/utils.scad>;

T = $t;
DEBUG = false;

module blm(
    width = 4 * 25.4,
    length = 4 * 25.4,
    height = .5 * 25.4,
    gutter = .25 * 25.4,
    radius = 3,
    extension_height = 5,

    color_a = "#2f2e31",
    color_b = "white",
    color_c = "#43DB43", // apple green
    color_d = "#DD3C64" // hot pink
) {
    e = .00841;
    aspect_ratio = 184.317 / 300;

    stroke = 1;
    stroke_height = extension_height;

    half_height = height / 2;

    available_width = width - gutter * 2;
    text_width = available_width - stroke * 2;
    text_length = (text_width * 184.317) / 300;

    module _text(color_a, color_b) {
        module _t(_height = 0, bleed = 0) {
            translate([
                gutter + stroke,
                length - gutter - text_length + stroke,
                half_height
            ]) {
                linear_extrude(height = _height) {
                    offset(delta = bleed) {
                        resize([text_width, text_length]) import("../blm_obj.svg");
                    }
                }
            }
        }

        _height = extension_height / 2;

        color(color_b) {
            render()
            _t(_height, 0);
        }

        color(color_a) {
            render()
            difference() {
                _t(stroke_height, stroke);

                translate([0, 0, -e]) {
                    _t(stroke_height + e * 2);
                }
            }
        }
    }

    module _keys(color_a, color_b) {
        key_gutter = 1;

        natural_width = (available_width - 7 * key_gutter) / 8;
        natural_length = length - gutter * 2.5 - text_length;
        natural_height = extension_height * .67;

        accidental_width = natural_width * .67;
        accidental_length = natural_length / 2;
        accidental_height = extension_height;

        module _k(include_natural = false, include_accidental = false, y = 0) {
            render() translate([gutter, gutter + y, half_height]) {
                keys(
                    count = 13,
                    starting_natural_key_index = 0,

                    natural_width = natural_width,
                    natural_length = natural_length,
                    natural_height = natural_height,

                    accidental_width = accidental_width,
                    accidental_length = accidental_length,
                    accidental_height = accidental_height,

                    gutter = key_gutter,

                    front_chamfer = 0,

                    include_natural = include_natural,
                    include_accidental = include_accidental,
                    include_cantilevers = false
                );
            }
        }

        color(color_a) _k(include_accidental = true);
        color(color_b) _k(include_natural = true, y = e);
    }

    module _box_half($fn = 36) {
        intersection() {
            translate([0, 0, -half_height]) {
                rounded_cube([width, length, height], radius, $fn = $fn);
            }

            translate([-e, -e, 0]) {
                cube([width + e * 2, length + e * 2, height + e]);
            }
        }
    }

    module _half(
        color_a = color_a,
        color_b = color_b,
        color_c = color_c
    ) {
        translate([width / -2, length / -2, 0]) {
            _text(color_a, color_b);
            _keys(color_a, color_b);
            color(color_c) render() _box_half();
        }
    }

    if (DEBUG) {
        translate([width / -2, length / -2, 0]) {
            color(color_c) _box_half(undef);
        }
        rotate([0, 180, 0]) translate([width / -2 + e, length / -2 + e, -e]) {
            color(color_d) _box_half(undef);
        }
    } else {
        _half(color_a, color_b, color_c);
        rotate([0, 180, 0]) _half(color_b, color_a, color_d);
    }
}

function ease_in_out_quad(t) = (
    t < .5
        ? 2 * pow(t, 2)
        : -1 + (4 - 2 * t) * t
);

function ease_in_out_cubic(t) = (
    t < .5
        ? 4 * pow(t, 3)
        : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1
);

function undulate(
    offset = 0,
    cycles = 1,
    t = $t
) = (
    abs(
        (((
            (t + offset) % 1
        ) % (1 / cycles)) * cycles)
        - 1 / 2
    ) * 2
);

function to_and_from(
    start,
    stop,
    offset = 0,
    cycles = 1
) = (
    ease_in_out_cubic(undulate(offset, cycles)) * (stop - start) + start
);

a = [12, 180, -18];
b = [3, 0, 18];

echo(T);
/* echo($vpr, $vpt, $vpd); */


offset = -5;
rotate([
    to_and_from(8, -4),
    T < .5
        ? offset + ease_in_out_cubic((T % .5) * 2) * 180
        : offset + ease_in_out_cubic((T % .5) * 2) * 180 + 180, // to_and_from(a[1], b[1]),
    to_and_from(1, -1)
]) blm();
