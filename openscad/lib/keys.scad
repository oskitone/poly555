include <values.scad>;

use <basic_shapes.scad>;
use <utils.scad>;

module keys(
    count,
    starting_natural_key_index = 0,

    natural_width,
    natural_length,
    natural_height,

    accidental_width,
    accidental_length,
    accidental_height,

    natural_actuator_y,
    accidental_actuator_y,
    actuator_length = BUTTON_DIAMETER,
    actuator_height = 2,

    remove_empty_space = false,
    wall = .8,
    ceiling = 1,

    front_fillet = 2,
    sides_fillet = 1,

    gutter = 1,

    cantilever_length = 0,
    cantilever_height = 0,
    cantilever_recession = 0,

    include_natural = true,
    include_accidental = true,
    include_cantilevers = true
) {
    max_fillet = max(front_fillet, sides_fillet);

    e = 0.04567;

    index_offset = [0,2,4,5,7,9,11][starting_natural_key_index];
    cantilver_width = min(
        accidental_width,
        natural_width - ((accidental_width - gutter) / 2) * 2 - gutter * 2
    );

    module _accidental_cutout(right = true) {
        // Exact size doesn't matter. Just needs to be big and defined.
        width = max(natural_width, accidental_width);

        length = accidental_length + gutter + e;

        // TODO: derive
        front_clearance = (accidental_height - natural_height) / 2;

        translate([
            right
                ? natural_width - (accidental_width - gutter) / 2 - gutter
                : width * -1 + (accidental_width - gutter) / 2
                    + gutter,
            natural_length - accidental_length - gutter,
            -e
        ]) {
            flat_top_rectangular_pyramid(
                top_width = width,
                top_length = length + front_clearance,
                bottom_width = width,
                bottom_length = length,
                height = natural_height + (e * 2),
                top_weight_y = 1
            );
        }
    }

    module _key_block(dimensions, is_natural, cut_left, cut_right) {
        cavity_width = dimensions[0] + e * 2;

        width = dimensions[0];
        length = dimensions[1];
        height = dimensions[2];

        module _base() {
            module _points() {
                module _donut() {
                    render() donut(
                        front_fillet * 2,
                        sides_fillet,
                        coverage = 90,
                        starting_angle = 180
                    );
                }

                // front bottom left
                translate([sides_fillet, sides_fillet, 0]) {
                    cylinder(r = sides_fillet, h = e);
                }

                // front top left
                translate([sides_fillet / 2, front_fillet, height - front_fillet]) {
                    rotate([0, 90, 0]) _donut();;
                }

                // front bottom right
                translate([width - sides_fillet, sides_fillet, 0]) {
                    cylinder(r = sides_fillet, h = e);
                }

                // front top right
                translate([width - sides_fillet / 2, front_fillet, height - front_fillet]) {
                    rotate([0, 90, 0]) _donut();;
                }

                // back bottom left
                translate([0, length - e, 0]) {
                    cube([e, e, e]);
                }

                // back bottom right
                translate([width - e, length - e, 0]) {
                    cube([e, e, e]);
                }

                // back top left
                translate([sides_fillet, length, height - sides_fillet]) {
                    rotate([90, 0, 0]) {
                        cylinder(r = sides_fillet, h = e);
                    }
                }

                // back top right
                translate([width - sides_fillet, length, height - sides_fillet]) {
                    rotate([90, 0, 0]) {
                        cylinder(r = sides_fillet, h = e);
                    }
                }
            }

            if (front_fillet + sides_fillet > 0) {
                hull() _points();
            } else {
                cube(dimensions);
            }
        }

        module _fillet() {
            if (front_fillet > 0) {
                translate([0, front_fillet, height - front_fillet]) {
                    rotate([0, 90, 0]) {
                        rounded_corner_cutoff(
                            height = width,
                            radius = front_fillet,
                            angle = 180
                        );
                    }
                }
            }
        }

        module _cantilever_recession_cavity() {
            x = -e;
            y = dimensions[1] - cantilever_recession;

            length = cantilever_recession + e;

            if (cantilever_recession > 0) {
                translate([x, y, -e]) {
                    cube([
                        cavity_width,
                        length,
                        cantilever_height + e
                    ]);
                }

                translate([x, y, cantilever_height - e]) {
                    flat_top_rectangular_pyramid(
                        top_width = cavity_width,
                        top_length = 0,
                        bottom_width = cavity_width,
                        bottom_length = length,
                        height = length,
                        top_weight_y = 1
                    );
                }
            }
        }

        module _empty_space_cavities() {
            inner_width = width - wall * 2;
            inner_length = length - wall * 2 - cantilever_recession;

            module _actuator(cap_height = 1) {
                x = wall - e;
                y = (is_natural ? natural_actuator_y : accidental_actuator_y)
                    - actuator_length / 2
                    + (is_natural ? 0 : accidental_length - natural_length);

                width = width - x * 2;

                translate([x, y, -e]) {
                    cube([width, actuator_length, actuator_height + e]);

                    translate([0, 0, actuator_height]) {
                        flat_top_rectangular_pyramid(
                            top_width = width,
                            top_length = 0,

                            bottom_width = width,
                            bottom_length = actuator_length,

                            height = cap_height
                        );
                    }
                }
            }

            module _ceiling_webbing(
                horizontal_height = 2,
                vertical_height = 1,
                depth = BREAKAWAY_SUPPORT_DEPTH,
                gap = BREAKAWAY_SUPPORT_DISTANCE
            ) {
                inner_width = width - wall * 2 - depth;
                inner_length = length - wall * 2 - cantilever_recession - depth;

                module _horizontal() {
                    x = wall - e;
                    z = height - ceiling - horizontal_height + e;

                    count = ceil(inner_length / gap);
                    plot = inner_length / count;

                    for (i = [0 : count]) {
                        translate([x, wall + i * plot, z]) {
                            cube([width - x * 2, depth, horizontal_height + e]);
                        }
                    }
                }

                module _vertical() {
                    z = height - ceiling - vertical_height + e;

                    count = ceil(inner_width / gap);
                    plot = inner_width / count;

                    for (i = [0 : count]) {
                        translate([wall + i * plot, wall - e, z]) {
                            cube([
                                depth,
                                inner_length + e * 2 + depth,
                                vertical_height + e
                            ]);
                        }
                    }
                }

                if (inner_length > gap) { _horizontal(); }
                if (inner_width > gap) { _vertical(); }
            }

            difference() {
                union() {
                    translate([wall, wall, -e]) {
                        cube([
                            width - wall * 2,
                            inner_length,
                            height - max(ceiling, front_fillet, sides_fillet) + e
                        ]);
                    }

                    if (ceiling < max_fillet) {
                        translate([wall, wall, height - max_fillet - e]) {
                            flat_top_rectangular_pyramid(
                                top_width = inner_width - (sides_fillet - wall),
                                top_length = inner_length - (front_fillet - wall),
                                bottom_width = inner_width,
                                bottom_length = inner_length,
                                height = max_fillet - ceiling + e,
                                top_weight_y = 1
                            );
                        }
                    }
                }

                if (cut_left) {
                    translate([wall, -wall, 0]) {
                        _accidental_cutout(right = false);
                    }
                }

                if (cut_right) {
                    translate([-wall, -wall, 0]) {
                        _accidental_cutout(right = true);
                    }
                }

                if (
                    natural_actuator_y != undef &&
                    accidental_actuator_y != undef
                ) {
                    _actuator();
                }

                _ceiling_webbing();
            }
        }

        difference() {
            _base();
            _fillet();
            _cantilever_recession_cavity();

            if (remove_empty_space) {
                _empty_space_cavities();
            }
        }

        if (include_cantilevers) {
             translate([
                 (dimensions[0] - cantilver_width) / 2,
                 dimensions[1] - cantilever_recession - e,
                 0
             ]) {
                 linear_extrude(cantilever_height) {
                     polygon(
                         points=[
                            [0, 0],
                            [cantilver_width, 0],
                            [cantilver_width + gutter / 2, cantilever_length + e * 2],
                            [-gutter / 2, cantilever_length + e * 2]
                        ]
                     );
                 }
             }
        }
    }

    module _natural(i, x, note_in_octave_index, natural_index) {
        cut_left = (
            (note_in_octave_index != 0 && note_in_octave_index != 5) &&
            i != 0
        );
        cut_right = (
            (note_in_octave_index != 4 && note_in_octave_index != 11) &&
            i != count - 1
        );

        translate([x, 0, 0]) {
            difference() {
                _key_block(
                    [natural_width, natural_length, natural_height],
                    is_natural = true,
                    cut_left = cut_left,
                    cut_right = cut_right
                );

                if (cut_left) {
                    _accidental_cutout(right = false);
                }

                if (cut_right) {
                    _accidental_cutout(right = true);
                }
            }
        }
    }

    module _accidental(i, x, note_in_octave_index, natural_index) {
        y = natural_length - accidental_length;

        translate([x, y, 0]) {
            _key_block(
                [accidental_width, accidental_length, accidental_height],
                is_natural = false
            );
        }
    }

    for (i = [0 : count - 1]) {
        adjusted_i = (i + index_offset);
        note_in_octave_index = adjusted_i % 12;
        natural_index = round(adjusted_i * (7 / 12));
        is_natural = len(search(note_in_octave_index, [1,3,6,8,10])) == 0;
        is_accidental = !is_natural;

        if (is_natural && include_natural) {
            x = (natural_width + gutter) * (natural_index - starting_natural_key_index);
            _natural(i, x, note_in_octave_index, natural_index);
        }

        if (is_accidental && include_accidental) {
            x = (natural_index - starting_natural_key_index) * (natural_width + gutter)
                 - (gutter / 2) - (accidental_width / 2);
            _accidental(i, x, note_in_octave_index, natural_index);
        }
    }
}

module mounted_keys(
    count,
    starting_natural_key_index = 0,

    natural_width,
    natural_length,
    natural_height,

    accidental_width,
    accidental_length,
    accidental_height,

    natural_actuator_y,
    accidental_actuator_y,
    actuator_length = BUTTON_DIAMETER,

    wall = .8,
    ceiling = 1,

    front_fillet = 2,
    sides_fillet = 1,

    gutter = 1,

    include_mount = true,
    include_natural = true,
    include_accidental = true,
    include_cantilevers = true,

    mount_length = 0,
    mount_height = 1,
    mount_hole_xs = [],
    mount_hole_diameter = PCB_MOUNT_HOLE_DIAMETER,
    mount_screw_head_diameter = SCREW_HEAD_DIAMETER,

    tolerance = .1,

    cantilever_length = 0,
    cantilever_height = 0,
    cantilever_recession = 0
) {
    $fn = 24;
    e = 0.0678;

    mount_width = get_keys_total_width(
        count = count,
        starting_note_index = get_starting_note_index(starting_natural_key_index),
        natural_width = natural_width,
        gutter = gutter
    );

    module _keys(naturals = true) {
        keys(
            count = count,
            starting_natural_key_index = starting_natural_key_index,

            natural_width = natural_width,
            natural_length = natural_length,
            natural_height = natural_height,

            accidental_width = accidental_width,
            accidental_length = accidental_length,
            accidental_height = accidental_height,

            natural_actuator_y = natural_actuator_y,
            accidental_actuator_y = accidental_actuator_y,
            actuator_length = actuator_length,

            wall = wall,
            ceiling = ceiling,

            front_fillet = front_fillet,
            sides_fillet = sides_fillet,

            gutter = gutter,

            include_natural = naturals,
            include_accidental = !naturals,
            include_cantilevers = include_cantilevers,

            cantilever_length = cantilever_length,
            cantilever_height = cantilever_height,
            cantilever_recession = cantilever_recession
        );
    }

    if (include_natural || include_accidental || include_mount) {
        mount_y = natural_length + cantilever_length - cantilever_recession;

        difference() {
            union() {
                if (include_natural) { _keys(true); }
                if (include_accidental) { _keys(false); }
                if (include_mount) {
                    translate([0, mount_y, 0]) {
                        cube([mount_width, mount_length, mount_height]);
                    }
                }
            }

            hole_array(
                mount_hole_xs,
                mount_hole_diameter,
                accidental_height + e * 2,
                mount_y + mount_length / 2,
                -e
            );
        }
    }
}

mounted_keys(
    count = 5,
    starting_natural_key_index = 3,

    natural_length = 50,
    natural_width = 15,
    natural_height = 13,

    accidental_width = 7.5,
    accidental_length = 30,
    accidental_height = 15,

    natural_actuator_y = 35,
    accidental_actuator_y = 40,
    actuator_length = BUTTON_DIAMETER,

    wall = .8,
    ceiling = 1,

    front_fillet = 2,
    sides_fillet = 1,

    gutter = 1,

    include_accidental = true,
    include_natural = true,

    mount_length = 5,
    mount_height = 2,
    mount_hole_diameter = 2,
    mount_screw_head_diameter = 4,
    mount_hole_xs = [5, 30, 40, 65, 82],

    cantilever_length = 4,
    cantilever_height = 2,
    cantilever_recession = 2
);
