include <values.scad>;

use <basic_shapes.scad>;
use <utils.scad>;

PENCIL_HEIGHT = 25.4 * 6;
PENCIL_DIAMETER = 6;

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

    diameter = PENCIL_STAND_CAVITY_DIAMETER + wall * 2;
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
    web_lengths = [.2, .5],
    web_depth = 10
) {
    e = .0481;

    web_depth = web_depth != undef ? web_depth : depth;

    module _webs() {
        module _(_length, _depth) {
            for (i = [0 : web_count - 1]) {
                rotation = 360 / web_count * i;

                rotate([angle_y, angle_x, 0]) rotate([0, 0, rotation]) {
                    translate([
                        web_width / -2,
                        PENCIL_STAND_CAVITY_DIAMETER / 2 - _length,
                        depth - wall - _depth + _length
                    ]) {
                        cube([web_width, _length + e, _depth - _length + e]);

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

        for (i = [0 : len(web_lengths) - 1]) {
            _(
                web_lengths[len(web_lengths) - i - 1],
                web_depth / len(web_lengths) * (1 + i)
            );
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
            _webs();
        }
    }

    if (chamfer > 0) {
        _chamfer();
    }
}

wall = 2;
depth = 40;
angle_x = 0; // to_and_from(-60, 60, 30, 3);
angle_y = 0; // to_and_from(-60, 60, 0, 1);
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
            add_tightening_webs = true
        );
    }
}
