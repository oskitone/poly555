include <values.scad>;

use <basic_shapes.scad>;
use <utils.scad>;

PENCIL_HEIGHT = 25.4 * 6;
PENCIL_DIAMETER = 6;

function is_vector(value) = (!!value[0]);

module pencil_stand_pencil(
    wall,
    depth = 20,
    angle_x = 45,
    angle_y = 45,
) {
    rotate([angle_y, angle_x, 0]) {
        translate([0, 0, depth - PENCIL_HEIGHT - wall]) {
            cylinder(d = PENCIL_DIAMETER, h = PENCIL_HEIGHT);
        }
    }
}

function _get_pencil_stand_arbitrary_extension(depth) = (depth * 4);
function _get_pencil_stand_total_depth(depth) = (
    depth + _get_pencil_stand_arbitrary_extension(depth)
);
function _get_pencil_stand_diameter(wall) = (
    PENCIL_STAND_CAVITY_DIAMETER + wall * 2
);


module _pencil_stand_cover(
    depth,
    height = undef,
    z = undef
) {
    total_depth = _get_pencil_stand_total_depth(depth);

    translate([
        -total_depth,
        -total_depth,
        z != undef ? z : -total_depth
    ]) {
        cube([
            total_depth * 2,
            total_depth * 2,
            height != undef ? height : total_depth
        ]);
    }
}

module pencil_stand(
    wall,
    depth = 20,
    angle_x = 45,
    angle_y = 45,
    show_pencil = false,
    $fn = DEFAULT_ROUNDING
) {
    e = 0.0987;

    diameter = _get_pencil_stand_diameter(wall);
    arbitrary_extension = _get_pencil_stand_arbitrary_extension(depth);
    total_depth = _get_pencil_stand_total_depth(depth);

    difference() {
        rotate([angle_y, angle_x, 0]) {
            translate([0, 0, -arbitrary_extension]) {
                cylinder(
                    d = diameter,
                    h = total_depth
                );
            }
        }

        _pencil_stand_cover(depth);
    }

    if (show_pencil) {
        % pencil_stand_pencil(
            wall = wall,
            depth = depth,
            angle_x = angle_x,
            angle_y = angle_y
        );
    }
}

module pencil_stand_cavity(
    wall,
    depth = 20,
    angle_x = 0,
    angle_y = 45,

    chamfer = 0,

    add_tightening_webs = false,
    web_count = 3,
    web_width = 2,
    web_length = [.2, .5], // .6,
    web_offset_angles = false, // TODO: rename
    web_depth = 10
) {
    e = .0481;

    web_depth = web_depth != undef ? web_depth : depth;

    module _webs(
        _length = web_length,
        _depth = web_depth,
        angle = 0
    ) {
        echo("_webs", _length, _depth, angle);

        for (i = [0 : web_count - 1]) {
            rotate([angle_y, angle_x, 0]) {
                rotate([0, 0, angle + 360 / web_count * i]) {
                    translate([
                        web_width / -2,
                        PENCIL_STAND_CAVITY_DIAMETER / 2 - _length,
                        depth - wall - _depth + _length
                    ]) {
                        cube([
                            web_width,
                            _length + e,
                            _depth - _length + e
                        ]);

                        translate([0, _length, -_length]) {
                            flat_top_rectangular_pyramid(
                                top_width = web_width,
                                top_length = _length,
                                bottom_width = web_width,
                                bottom_length = 0,
                                height = _length + e,
                                top_weight_y = 1
                            );
                        }
                    }
                }
            }
        }
    }

    module _chamfer() {
        module _layer(bleed, z) {
            intersection() {
                _pencil_stand_cover(
                    depth,
                    height = e,
                    z = z
                );

                pencil_stand(
                    wall = bleed,
                    depth = depth,
                    angle_x = angle_x,
                    angle_y = angle_y
                );
            }
        }

        height = PENCIL_STAND_CAVITY_DIAMETER / 2 - e;

        hull() {
            _layer(chamfer + e * 2, 0);
            _layer(-height, height);
        }
    }

    difference() {
        pencil_stand(
            wall = 0,
            depth = depth - wall,
            angle_x = angle_x,
            angle_y = angle_y
        );

        if (add_tightening_webs) {
            if (is_vector(web_length)) {
                for (i = [0 : len(web_length) - 1]) {
                    _webs(
                        _length = web_length[len(web_length) - i - 1],
                        _depth = web_depth / len(web_length) * (1 + i),
                        /* angle = 180 / len(web_length) * i */
                        angle = web_offset_angles
                            ? (180 / web_count) * (i % 2)
                            : 0
                    );
                }
            } else {
                _webs();
            }
        }
    }

    if (chamfer > 0) {
        _chamfer();
    }
}


module _test(
    web_lengths = [.6],
    web_offset_angless = [true],

    angle_x = to_and_from(-60, 60, 30, 3),
    angle_y = to_and_from(-60, 60, 0, 1),

    wall = 2,
    depth = 40,

    engraving_depth = .8
) {
    e = .048;

    diameter = PENCIL_STAND_CAVITY_DIAMETER + wall * 1.5;

    function pretty_number(number) = (
        (number != 0 && number < 1)
            ? str(
                number < 0 ? "-" : "",
                ".",
                abs(number) * 10
            )
            : str(number)
    );

    for (i = [0 : len(web_offset_angless) - 1]) {
        translate([diameter * i, 0, 0]) {
            difference() {
                pencil_stand(
                    wall = wall,
                    depth = depth,
                    angle_x = angle_x,
                    angle_y = angle_y
                );

                translate([0, 0, -.02]) {
                    pencil_stand_cavity(
                        wall = wall,
                        depth = depth,
                        angle_x = angle_x,
                        angle_y = angle_y,

                        chamfer = 1,

                        add_tightening_webs = true,
                        web_length = web_lengths[0],
                        web_offset_angles = web_offset_angless[i]
                    );
                }

                translate([0, 0, depth - engraving_depth]) {
                    linear_extrude(height = engraving_depth + e) {
                        offset(delta = .1) {
                            text(
                                web_offset_angless[i] ? "T" : "F",
                                size = 4,
                                font = "Orbitron:style=Black",
                                halign = "center",
                                valign = "center"
                            );
                        }
                    }
                }
            }
        }
    }
}

_test(
    /* web_lengths = [0, .2, .4, .6, .8, 1, 1.2, 1.4], */
    web_lengths = [ [.2, .6, 1] ],
    /* web_offset_angless = [false, true], */

    angle_x = -52,
    angle_y = 20,

    wall = 1,
    depth = 12.8
);
