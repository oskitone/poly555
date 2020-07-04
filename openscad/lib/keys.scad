include <values.scad>;

module flat_top_rectangular_pyramid(
    top_width = 0,
    top_length = 0,

    bottom_width = 0,
    bottom_length = 0,

    height = 0,

    top_x = undef,
    top_y = undef,

    top_weight_x = .5,
    top_weight_y = .5
) {
    top_x = top_x != undef
        ? top_x
        : (bottom_width - top_width) * top_weight_x;
    top_y = top_y != undef
        ? top_y
        : (bottom_length - top_length) * top_weight_y;

    max_difference = max(bottom_width - top_width, bottom_length - top_length);
    height = height == undef
        ? max_difference / 2
        : height;

    polyhedron(
        [
            [0, 0, 0],
            [bottom_width, 0, 0],
            [bottom_width, bottom_length, 0],
            [0, bottom_length, 0],
            [top_x, top_y, height],
            [top_width + top_x, top_y, height],
            [top_width + top_x, top_length + top_y, height],
            [top_x, top_length + top_y, height]
        ], [
            [0, 1, 2, 3],
            [4, 5, 1, 0],
            [7, 6, 5, 4],
            [5, 6, 2, 1],
            [6, 7, 3, 2],
            [7, 4, 0, 3]
        ]
    );
}

module keys(
    count,
    starting_index = 0,

    natural_width,
    natural_length,
    natural_height,

    accidental_width,
    accidental_length,
    accidental_height,

    gutter = 1,

    include_natural = true,
    include_accidental = true
) {
    e = 0.04567;

    index_offset = [0,2,4,5,7,9,11][starting_index];

    module _cutout(right = true) {
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

    module _natural(i, x, note_in_octave_index, natural_index) {
        cutLeft = (
            (note_in_octave_index != 0 && note_in_octave_index != 5) &&
            i != 0
        );
        cutRight = (
            (note_in_octave_index != 4 && note_in_octave_index != 11) &&
            i != count - 1
        );

        translate([x, 0, 0]) {
            difference() {
                cube([
                    natural_width,
                    natural_length,
                    natural_height
                ]);

                if (cutLeft) {
                    _cutout(right = false);
                }

                if (cutRight) {
                    _cutout(right = true);
                }
            }
        }
    }

    module _accidental(i, x, note_in_octave_index, natural_index) {
        y = natural_length - accidental_length;

        translate([x, y, 0]) {
            cube([
                accidental_width,
                accidental_length,
                accidental_height
            ]);
        }
    }

    for (i = [0 : count - 1]) {
        adjusted_i = (i + index_offset);
        note_in_octave_index = adjusted_i % 12;
        natural_index = round(adjusted_i * (7 / 12));
        is_natural = len(search(note_in_octave_index, [1,3,6,8,10])) == 0;
        is_accidental = !is_natural;

        if (is_natural && include_natural) {
            x = (natural_width + gutter) * (natural_index - starting_index);
            _natural(i, x, note_in_octave_index, natural_index);
        }

        if (is_accidental && include_accidental) {
            x = (natural_index - starting_index) * (natural_width + gutter)
                 - (gutter / 2) - (accidental_width / 2);
            _accidental(i, x, note_in_octave_index, natural_index);
        }
    }
}

module mounted_keys(
    count,
    starting_index = 0,

    natural_width,
    natural_length,
    natural_height,

    accidental_width,
    accidental_length,
    accidental_height,

    gutter = 1,

    include_natural = true,
    include_accidental = true,

    mount_width = 0, // TODO: derive and remove!
    mount_length = 0,
    mount_height = 1,
    mount_hole_xs = [],
    mount_hole_diameter = PCB_MOUNT_HOLE_DIAMETER,
    mount_screw_head_diameter = SCREW_HEAD_DIAMETER,

    cantilever_length = 2,
    cantilever_height = 1
) {
    $fn = 24;
    e = 0.0678;

    module _mount_holes() {
        for (x = mount_hole_xs) {
            translate([x, natural_length - mount_length / 2, 0]) {
                translate([0, 0, -e]) {
                    cylinder(
                        d = mount_hole_diameter,
                        h = accidental_height + e * 2
                    );
                }

                translate([0, 0, mount_height - e]) {
                    cylinder(
                        d = mount_screw_head_diameter,
                        h = accidental_height - mount_height + e * 2
                    );
                }
            }
        }
    }

    module _cantilever_cutout(height) {
        translate([-e, natural_length - mount_length - cantilever_length, -e]) {
            cube([
                mount_width + e * 2,
                cantilever_length,
                height - cantilever_height
            ]);
        }
    }

    module _keys(naturals = true) {
        difference() {
            keys(
                count = count,
                starting_index = starting_index,

                natural_width = natural_width,
                natural_length = natural_length,
                natural_height = natural_height,

                accidental_width = accidental_width,
                accidental_length = accidental_length,
                accidental_height = accidental_height,

                gutter = gutter,

                include_natural = naturals,
                include_accidental = !naturals
            );

            _cantilever_cutout(naturals ? natural_height : accidental_height);
        }
    }

    difference() {
        union() {
            if (include_natural) { _keys(true); }
            if (include_accidental) { _keys(false); }

            translate([0, natural_length - mount_length, 0]) {
                cube([mount_width, mount_length, mount_height]);
            }
        }

        _mount_holes();
    }
}

mounted_keys(
    count = 13,
    starting_index = 3,

    natural_length = 20,
    natural_width = 10,
    natural_height = 10,

    accidental_width = 7.5,
    accidental_length = 10,
    accidental_height = 15,

    gutter = 1,

    mount_width = 10 * 8 + 1 * (8 - 1),
    mount_length = 5,
    mount_hole_diameter = 2,
    mount_screw_head_diameter = 4,
    mount_hole_xs = [5, 30, 40, 65, 82],

    cantilever_length = 2,
    cantilever_height = 1
);
