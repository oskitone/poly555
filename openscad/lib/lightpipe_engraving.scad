include <values.scad>;

NONE = 0;
HALF = 1;
FULL = 2;

module lightpipe_engraving(
    width = 46, // side_panel_width
    length = 11, // branding_length,
    height = 27.8,
    engraving_height = 1,
    subtract_engraving_height = true,
    screen_height = 10,
    led_diameter = LED_DIAMETER,
    led_height = LED_HEIGHT,
    wall = 1.2,
    tolerance = .1,
    fill = FULL,
    inner_wall_height = .6,
    inner_walls_count = 3,
    viewing_angle = undef,
    inner_wall_diameter = undef
) {
    e = .004567;

    height = subtract_engraving_height
        ? height - engraving_height
        : height;

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
                height - screen_height - e
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

    module _inner_walls() {
        /* assert(inner_wall_diameter > min(width, length) - wall * 2); */
        plot_height = (height - wall - led_height) / inner_walls_count;

        if (inner_walls_count > 0) {
            intersection() {
                for (i = [0 : inner_walls_count - 1]) {
                    z = i * plot_height + led_height;

                    inner_wall_diameter =
                        viewing_angle
                            ? max(
                                (tan(viewing_angle) * (z - led_height * .5)) * 2,
                                min(width, length) - wall * 2
                            )
                            : max(width, length);

                    intersection() {
                        translate([width / -2, length / -2, z]) {
                            cube([width, length, inner_wall_height]);
                        }

                        translate([
                            inner_wall_diameter / -2,
                            inner_wall_diameter / -2,
                            z - e
                        ]) {
                            cube([
                                inner_wall_diameter,
                                inner_wall_diameter,
                                inner_wall_height + e * 2
                            ]);
                        }
                    }
                }

                _outer_wall();
            }
        }
    }

    module _cross_section() {
        translate([width / -2 - e, 0, -e]) {
            cube([width + e * 2, length / 2 + e, height + engraving_height + e * 2]);
        }

        * translate([width / -2 - e, length / -2 - e - e, -e]) {
            cube([width / 2, length + e * 2, height + engraving_height + e * 2]);
        }
    }

    module _branding(
        ratio = 2,
        end_gutter = .75,
        line_gutter = .25
    ) {
        module _text(
            string,
            size,
            font = "Work Sans:style=Black",
            bleed = -tolerance,
            y = 0
        ) {
            translate([0, y, height - e]) {
                linear_extrude(height = engraving_height + e) {
                    offset(delta = bleed) {
                        text(
                            string,
                            size = size,
                            font = font,
                            halign = "center",
                            valign = "center"
                        );
                    }
                }
            }
        }

        available_length = length - end_gutter * 2 - line_gutter;
        brand_size = (available_length / (ratio + 1)) * ratio;
        model_size = available_length / (ratio + 1);

        _text(
            "OSKITONE",
            size = brand_size,
            y = length / 2 - end_gutter - brand_size / 2
        );
        _text(
            "XYZ0123",
            size = model_size,
            y = length / -2 + end_gutter + model_size / 2,
            font="Orbitron:style=Black",
            bleed = 0
        );
    }

    module _output() {
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

        # _inner_walls();
        _branding();
    }

    intersection() {
        _output();
        * _cross_section();
    }
}

gutter = -.1;

width = 46 + gutter;
length = 11 + gutter;
height = 0; // 27.8 + gutter;

viewing_angles = [undef];
inner_walls_counts = [0]; // [2, 3, 4];
for (i = [0 : len(viewing_angles) - 1]) {
    for (ii = [0 : len(inner_walls_counts) - 1]) {
        translate([width * i, length * ii, height * ii]) {
            lightpipe_engraving(
                /* viewing_angle = viewing_angles[i], */
                /* inner_walls_count = inner_walls_counts[ii] */
            );

            % cylinder(d = LED_DIAMETER, h = LED_HEIGHT);
        }
    }
}
