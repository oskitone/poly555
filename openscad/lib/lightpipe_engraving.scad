include <values.scad>;

NONE = 0;
HALF = 1;
FULL = 2;

module lightpipe_engraving(
    width = 46, // side_panel_width
    length = 11, // branding_length,
    height = 27.8,
    screen_height = 10,
    led_diameter = LED_DIAMETER,
    led_height = LED_HEIGHT,
    wall = 1.8,
    tolerance = .1,
    fill = NONE
) {
    e = .004567;

    outer_diameter = led_diameter + wall * 2;

    module _outer_wall() {
        hull() {
            translate([
                width / -2,
                length / -2,
                height - screen_height
            ]) {
                cube([width, length, screen_height]);
            }

            cylinder(
                h = led_height,
                d = outer_diameter
            );
        }
    }

    module _led_cavity() {
        translate([0, 0, -e]) {
            cylinder(
                h = led_height + e * 2,
                d = led_diameter + tolerance * 2
            );
        }
    }

    module _inner_cavity(
        top = height - screen_height,
        bottom = 0
    ) {
        hull() {
            translate([0, 0, bottom - e]) {
                cylinder(
                    h = e * 2,
                    d = led_diameter
                );
            }

            translate([
                width / -2 + wall,
                length / -2 + wall,
                height - screen_height - e // top - e
            ]) {
                cube([
                    width - wall * 2,
                    length - wall * 2,
                    e * 2
                ]);
            }

            if (top > height - screen_height) {
                translate([
                    width / -2 + wall,
                    length / -2 + wall,
                    top - e
                ]) {
                    cube([
                        width - wall * 2,
                        length - wall * 2,
                        e * 2
                    ]);
                }
            }
        }
    }

    module _cross_section() {
        translate([
            width / -2 - e,
            0,
            -e
        ]) {
            cube([width + e * 2, length / 2 + e, height + e * 2]);
        }
    }

    intersection() {
        difference() {
            _outer_wall();
            _led_cavity();

            if (fill == NONE) {
            } if (fill == HALF) {
                _inner_cavity(top = height - screen_height);
            } if (fill == FULL) {
                _inner_cavity(top = height - wall);
            }
        }

        /* _cross_section(); */
    }
}

length = 11 - .1;
fills = [NONE, HALF, FULL];

for (i = [0 : len(fills) - 1]) {
    translate([0, length * i, 0]) {
        lightpipe_engraving(fill = fills[i]);
    }
}
