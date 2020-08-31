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

module assembly(
    key_gutter = 1,
    accidental_key_recession = 2,
    natural_key_exposed_height = 3,
    accidental_key_extra_height = 3,

    enclosure_wall = 1.8,
    enclosure_inner_wall = 1.2,
    enclosure_to_component_z_clearance = 2,
    enclosure_chamfer = 2,
    enclosure_rounding = 24,

    engraving_depth = 1,

    exposed_screw_head_clearance = .4,
    speaker_to_pcb_clearance = 2.4,

    mount_length = 6,
    cantilever_length = 3,
    cantilever_height = 1,

    tolerance = .1,

    keys_count = 20,
    starting_natural_key_index = 3,
    key_travel = 1.4,

    volume_wheel_exposure = 2,
    volume_wheel_cap_height = 1,

    show_enclosure_bottom = true,
    show_battery = true,
    show_speaker = true,
    show_switch = true,
    show_pcb = true,
    show_mounting_rails = true,
    show_keys = true,
    show_enclosure_top = true,
    show_hinge_parts = true,
    show_window_pane = false,
    show_just_hinge_parts = false,

    enclosure_color = undef,
    enclosure_opacity = .75,
    pcb_color = "purple",
    pcb_opacity = .75,
    natural_key_color = "white",
    accidental_key_color = "black",
    key_opacity = .75,
    window_pane_color = "blue",
    window_pane_opacity = .05,

    quick_preview = false
) {
    e = 0.0145;
    plot = PCB_BUTTONS[1][0] - PCB_BUTTONS[0][0];
    enclosure_gutter = mount_length;

    keys_back_gutter = tolerance * 2;
    cantilever_recession = cantilever_length - keys_back_gutter;

    natural_key_width = plot * 2 - key_gutter;
    natural_key_length = natural_key_width * 4
        - (cantilever_length - cantilever_recession) - mount_length;

    mount_width= get_keys_total_width(
        count = keys_count,
        starting_note_index =
            get_starting_note_index(starting_natural_key_index),
        natural_width = natural_key_width,
        gutter = key_gutter
    );
    mount_height = BUTTON_HEIGHT;

    mounted_keys_total_length = natural_key_length
        + (cantilever_length - cantilever_recession)
        + mount_length;

    keys_mount_end_on_pcb = BOTTOM_MOUNTED_PCB_HOLES[0][1] +  mount_length / 2;
    keys_y_over_pcb = mounted_keys_total_length - keys_mount_end_on_pcb;
    keys_from_pcb_x_offset = PCB_BUTTONS[0][0] - BUTTON_WIDTH / 2 - plot + key_gutter / 2;
    keys_cavity_length = natural_key_length + key_gutter + keys_back_gutter;
    keys_and_bumper_cavity_length = keys_cavity_length + enclosure_gutter
        - key_gutter;

    mount_hole_xs = [
        BOTTOM_MOUNTED_PCB_HOLES[0][0] - keys_from_pcb_x_offset,
        BOTTOM_MOUNTED_PCB_HOLES[1][0] - keys_from_pcb_x_offset,
        BOTTOM_MOUNTED_PCB_HOLES[2][0] - keys_from_pcb_x_offset,
        BOTTOM_MOUNTED_PCB_HOLES[3][0] - keys_from_pcb_x_offset,
    ];

    pcb_window_y_extension = PCB_COMPONENTS_Y - keys_mount_end_on_pcb;
    pcb_x = enclosure_gutter - keys_from_pcb_x_offset;
    pcb_y = mounted_keys_total_length - keys_mount_end_on_pcb + enclosure_gutter;
    pcb_z = enclosure_wall + max(
        MOUNT_STILT_MINIMUM_HEIGHT,
        SWITCH_BASE_HEIGHT + SWITCH_ACTUATOR_HEIGHT
            - enclosure_wall + exposed_screw_head_clearance
    );
    pcb_stilt_height = pcb_z - enclosure_wall;

    enclosure_width = enclosure_gutter * 2 + mount_width;
    enclosure_length = pcb_y + keys_mount_end_on_pcb
        + PCB_COMPONENTS_LENGTH + pcb_window_y_extension * 2
        + enclosure_gutter;

    enclosure_height = enclosure_wall * 2
        + max(
            pcb_stilt_height + PCB_HEIGHT + PCB_COMPONENTS_HEIGHT
                + WINDOW_PANE_HEIGHT,
            SPEAKER_HEIGHT - SPEAKER_MAGNET_HEIGHT + BATTERY_HEIGHT
        )
        + enclosure_to_component_z_clearance;
    // TODO: tidy
    enclosure_bottom_height = pcb_z + PCB_HEIGHT + POT_HEIGHT
        + volume_wheel_cap_height
        - 3.5; // total wheel  height
    enclosure_top_height = enclosure_height - enclosure_bottom_height;

    key_height = enclosure_height - pcb_stilt_height - enclosure_wall
        - PCB_HEIGHT - mount_height - accidental_key_extra_height
        - accidental_key_recession;
    keys_x = pcb_x + keys_from_pcb_x_offset;
    assert(keys_x == enclosure_gutter, "keys_x should equal enclosure_gutter");
    keys_y = pcb_y
        - natural_key_length
        - (cantilever_length - cantilever_recession)
        + keys_mount_end_on_pcb
        - mount_length;
    keys_z = pcb_z + PCB_HEIGHT + BUTTON_HEIGHT;
    key_mounting_rail_y = pcb_y + keys_mount_end_on_pcb - mount_length;

    battery_x = enclosure_width - BATTERY_WIDTH - enclosure_wall - tolerance;
    battery_y = enclosure_length - enclosure_wall - BATTERY_LENGTH;

    switch_x = pcb_x + PCB_SWITCH_X;
    switch_y = pcb_y + PCB_SWITCH_Y;
    switch_z = pcb_z;
    switch_exposure_height = switch_z - SWITCH_BASE_HEIGHT;

    // TODO: differentiate between window vs pane vs cavity, etc
    window_and_side_panel_gutter = enclosure_gutter - key_gutter;
    window_pane_y = pcb_y + keys_mount_end_on_pcb
        - (mount_length - PCB_MOUNT_HOLE_DIAMETER) / 2;
    window_pane_z = enclosure_height - enclosure_wall - WINDOW_PANE_HEIGHT;
    window_pane_width = PCB_COMPONENTS_WIDTH +
        ((pcb_x + PCB_COMPONENTS_X) - window_and_side_panel_gutter) * 2;
    window_pane_length = PCB_COMPONENTS_LENGTH + pcb_window_y_extension * 2;

    side_panel_width = enclosure_width
        - window_and_side_panel_gutter * 3
        - window_pane_width;
    side_panel_x = enclosure_width - side_panel_width - window_and_side_panel_gutter;
    side_panel_y = key_mounting_rail_y + mount_length;
    side_panel_length = enclosure_length - enclosure_gutter - side_panel_y;

    volume_wheel_diameter = volume_wheel_exposure +
        (enclosure_width - (pcb_x + PCB_VOLUME_WHEEL_X)) * 2;

    branding_length = 11; // TODO: derive or obviate
    speaker_grill_length = side_panel_length - branding_length - enclosure_gutter;
    speaker_grill_y = side_panel_y + side_panel_length - speaker_grill_length;

    speaker_x = side_panel_x + side_panel_width / 2;
    speaker_y = speaker_grill_y + (speaker_grill_length - SPEAKER_LENGTH) / 2
        + SPEAKER_LENGTH / 2;
    speaker_z = enclosure_height - enclosure_wall - SPEAKER_HEIGHT;

    echo("Enclosure dimensions", [enclosure_width, enclosure_length, enclosure_height]);
    echo("Window pane dimensions", [window_pane_width, window_pane_length]);

    module _mounted_keys(
        include_natural = false,
        include_accidental = false,
        include_hitch = false
    ) {
        translate([keys_x, keys_y, keys_z]) {
            mounted_keys(
                count = keys_count,
                starting_natural_key_index = starting_natural_key_index,

                natural_width = natural_key_width,
                natural_length = natural_key_length,
                natural_height = key_height,

                accidental_width = 7.5,
                accidental_length = natural_key_length * 3/5,
                accidental_height = key_height + accidental_key_extra_height,

                front_and_sides_chamfer = quick_preview ? 0 : 2,

                gutter = key_gutter,

                mount_length = mount_length,
                mount_height = cantilever_height,
                mount_hole_xs = mount_hole_xs,

                cantilever_length = cantilever_length,
                cantilever_height = cantilever_height,
                cantilever_recession = cantilever_recession,

                include_mount = include_natural,
                include_natural = include_natural,
                include_accidental = include_accidental,
                include_hitch = include_hitch,
                include_print_supports = true,

                key_travel = key_travel,

                hitch_height = mount_height + HITCH_RECOMMENDED_MINIMUM_CAVITY_HEIGHT,
                hitch_y = pcb_y - keys_y + TOP_MOUNTED_PCB_HOLES[0][1],
                hitch_z = -mount_height
            );
        }
    }

    module _keys() {
        color(natural_key_color, key_opacity) {
            _mounted_keys(include_natural = true);
        }
        color(accidental_key_color, key_opacity) {
            _mounted_keys(include_accidental = true);
        }
    }

    module _mounting_rail_aligners(bleed = 0) {
        width_length = enclosure_inner_wall + bleed;
        length = mount_length / 2 + bleed * 2;
        height = pcb_stilt_height + PCB_HEIGHT + mount_height;

        y = key_mounting_rail_y + (mount_length - length) / 2;
        z = enclosure_wall - e;

        for (x = [
            enclosure_wall - e,
            enclosure_width - enclosure_wall - width_length
        ]) {
            translate([x, y, z]) {
                cube([
                    width_length,
                    length,
                    height + e * 2
                ]);
            }
        }
    }

    module _enclosure() {
        module _enclosure_half(
            is_top,
            width = enclosure_width,
            length = enclosure_length,
            height
        ) {
            position = is_top
                ? [enclosure_width, 0, enclosure_height]
                : [0, 0, 0];

            rotation = is_top ? [180, 0, 180] : [0, 0, 0];

            translate(position) rotate(rotation) {
                enclosure_half(
                    width = width,
                    length = length,
                    height = height != undef
                        ? height
                        : is_top
                            ? enclosure_top_height
                            : enclosure_bottom_height,

                    wall = enclosure_wall,
                    floor_ceiling = undef,

                    add_lip = !is_top,
                    remove_lip = is_top,

                    include_hinge = true,
                    include_hinge_parts = show_hinge_parts,
                    include_clasp = false,
                    just_hinge_parts = show_just_hinge_parts,

                    radius = quick_preview ? 0 : enclosure_chamfer,
                    tolerance = tolerance,

                    $fn = enclosure_rounding
                );
            }
        }

        module _keys_and_bumper_cavity(length_adjustment = 0) {
            z = enclosure_bottom_height - LIP_BOX_DEFAULT_LIP_HEIGHT - e;

            translate([-e, -e, z]) {
                cube([
                    enclosure_width + e * 2,
                    keys_and_bumper_cavity_length + length_adjustment,
                    enclosure_height - z + e
                ]);
            }
        }

        module _bottom() {
            module _switch_container() {
                translate([
                    switch_x - SWITCH_ORIGIN.x - enclosure_inner_wall,
                    switch_y - SWITCH_ORIGIN.y - enclosure_inner_wall,
                    switch_exposure_height - e
                ]) {
                    cube([
                        SWITCH_BASE_WIDTH + enclosure_inner_wall * 2,
                        SWITCH_BASE_LENGTH + enclosure_inner_wall * 2,
                        SWITCH_BASE_HEIGHT + e
                    ]);
                }
            }

            module _battery_container(
                width = BATTERY_LENGTH * .5,
                wall = enclosure_inner_wall,
                ramp = 5
            ) {
                translate([
                    battery_x + (BATTERY_WIDTH - width) / 2,
                    battery_y - wall - ramp,
                    enclosure_wall
                ]) {
                    flat_top_rectangular_pyramid(
                        top_width = width,
                        top_length = wall,
                        bottom_width = width,
                        bottom_length = wall + ramp,
                        height = BATTERY_HEIGHT * .5,
                        top_weight_y = 1
                    );
                }
            }

            module _switch_exposure(
                xy_bleed = 0,
                include_switch_cavity = true,
                z_bleed = 0
            ) {
                width_extension = switch_exposure_height;
                length_extension = switch_exposure_height;

                translate([
                    switch_x - SWITCH_ORIGIN.x - width_extension - xy_bleed,
                    switch_y - SWITCH_ORIGIN.y - length_extension - xy_bleed,
                    -z_bleed
                ]) {
                    flat_top_rectangular_pyramid(
                        top_width = SWITCH_BASE_WIDTH + xy_bleed * 2,
                        top_length = SWITCH_BASE_LENGTH + xy_bleed * 2,

                        bottom_width = SWITCH_BASE_WIDTH + xy_bleed * 2
                            + width_extension * 2,
                        bottom_length = SWITCH_BASE_LENGTH + xy_bleed * 2
                            + length_extension * 2,

                        height = switch_exposure_height + z_bleed * 2
                    );
                }

                if (include_switch_cavity) {
                    translate([
                        switch_x - SWITCH_ORIGIN.x - xy_bleed,
                        switch_y - SWITCH_ORIGIN.y - xy_bleed,
                        switch_exposure_height - z_bleed
                    ]) {
                        cube([
                            SWITCH_BASE_WIDTH + xy_bleed * 2,
                            SWITCH_BASE_LENGTH + xy_bleed * 2,
                            SWITCH_BASE_HEIGHT + z_bleed * 2
                        ]);
                    }
                }
            }

            module _mount_stilts_and_spacers() {
                intersection() {
                    translate([pcb_x, pcb_y, pcb_z - e]) {
                        mount_stilts(
                            positions = concat(
                                TOP_MOUNTED_PCB_HOLES,
                                BACK_PCB_HOLES
                            ),
                            height = pcb_stilt_height,
                            z = -pcb_stilt_height
                        );
                    }

                    translate([
                        enclosure_wall - e,
                        enclosure_wall - e,
                        enclosure_wall - e
                    ]) {
                        cube([
                            enclosure_width - enclosure_wall * 2 + e * 2,
                            enclosure_length - enclosure_wall * 2 + e * 2,
                            enclosure_height
                        ]);
                    }
                }

                for (p = BOTTOM_MOUNTED_PCB_HOLES) {
                    translate([pcb_x + p.x, pcb_y + p.y, e]) {
                        ring(
                            diameter = SCREW_HEAD_DIAMETER + enclosure_wall * 2,
                            height = SCREW_HEAD_HEIGHT
                                + exposed_screw_head_clearance + enclosure_wall
                                - e,
                            inner_diameter = SCREW_HEAD_DIAMETER
                                + tolerance * 2,
                            $fn = DEFAULT_ROUNDING
                        );
                    }
                }

                translate([pcb_x, pcb_y, enclosure_wall - e]) {
                    spacer_array(
                        BOTTOM_MOUNTED_PCB_HOLES,
                        height = pcb_stilt_height + e,
                        wall = enclosure_wall
                    );
                }
            }

            module _screw_cavities() {
                $fn = HIDEF_ROUNDING;

                module _chamfer(diameter, chamfer = 1, $fn = DEFAULT_ROUNDING) {
                    cylinder(
                        d1 = diameter + chamfer * 2,
                        d2 = diameter,
                        h = chamfer
                    );
                }

                module _heads() {
                    diameter = SCREW_HEAD_DIAMETER + tolerance * 2;
                    height = SCREW_HEAD_HEIGHT + exposed_screw_head_clearance + e;

                    for (p = BOTTOM_MOUNTED_PCB_HOLES) {
                        translate([pcb_x + p.x, pcb_y + p.y, -e]) {
                            cylinder(d = diameter, h = height);
                            _chamfer(diameter);
                        }
                    }
                }

                _heads();

                for (xy = TOP_MOUNTED_PCB_HOLES) {
                    translate([pcb_x + xy[0], pcb_y + xy[1], -e]) {
                        cylinder(
                            d = PCB_MOUNT_HOLE_DIAMETER,
                            h = enclosure_wall + e * 2
                        );
                        _chamfer(PCB_MOUNT_HOLE_DIAMETER);
                    }
                }
        }

            // TODO: obviate
            module _screw_head_cavity_bridges(
                diameter = PCB_MOUNT_HOLE_DIAMETER + e * 2,
                $fn = DEFAULT_ROUNDING
            ) {
                for (p = BOTTOM_MOUNTED_PCB_HOLES) {
                    translate([
                        pcb_x + p.x,
                        pcb_y + p.y,
                        SCREW_HEAD_HEIGHT + exposed_screw_head_clearance
                    ]) {
                        cylinder(
                            d = diameter,
                            h = SACRIFICIAL_BRIDGE_HEIGHT
                        );
                    }
                }
            }

            module _keys_bumper() {
                keys_exposed_height = accidental_key_extra_height
                    + natural_key_exposed_height;

                z_offset = keys_exposed_height + accidental_key_recession;

                bumper_length = keys_cavity_length + enclosure_gutter - key_gutter;
                bumper_height = enclosure_height - enclosure_bottom_height
                    - accidental_key_recession - keys_exposed_height;

                xy = enclosure_gutter - key_gutter;
                z = enclosure_height - enclosure_wall - z_offset;

                width = mount_width + key_gutter * 2;

                support_depth = xy - enclosure_wall;
                cavity_length_adjustment = tolerance * -2;

                module _front_lip_and_lower_sides() {
                    intersection() {
                        translate([0, 0, -z_offset]) {
                            _enclosure_half(
                                is_top = true,
                                length = bumper_length + enclosure_chamfer,
                                height = bumper_height
                            );
                        }
                        _keys_and_bumper_cavity(cavity_length_adjustment);
                    }

                    translate([
                        enclosure_wall - e,
                        enclosure_wall - e,
                        z - support_depth
                    ]) {
                        cube([
                            enclosure_width - enclosure_wall * 2 + e * 2,
                            keys_and_bumper_cavity_length
                                + cavity_length_adjustment - enclosure_wall
                                - e,
                            support_depth
                        ]);
                    }
                }

                module _bumper_arms() {
                    lip_z = enclosure_bottom_height + bumper_height;
                    chamfer = quick_preview ? 0 : enclosure_chamfer;

                    width = xy;
                    length = bumper_length + cavity_length_adjustment;
                    height = enclosure_height - lip_z + chamfer * 2;

                    z = enclosure_height - height;

                    for (x = [0, enclosure_width - xy]) {
                        translate([x, 0, z - e]) {
                            difference() {
                                rounded_cube(
                                    [width, length + chamfer, height + e],
                                    chamfer,
                                    $fn = enclosure_rounding
                                );

                                // Chop off chamfer end
                                translate([-e, length, -e]) {
                                    cube([
                                        width + e * 2,
                                        chamfer + e,
                                        height + e * 2
                                    ]);
                                }
                            }
                        }
                    }
                }

                module _keys_cavity() {
                    translate([xy, xy, z - e]) {
                        cube([
                            width,
                            keys_cavity_length,
                            enclosure_wall + e * 2
                        ]);
                    }

                    translate([
                        xy - support_depth,
                        xy - support_depth,
                        z - support_depth - e
                    ]) {
                        flat_top_rectangular_pyramid(
                            top_width = width,
                            top_length = keys_cavity_length,
                            bottom_width = width + support_depth * 2,
                            bottom_length = keys_cavity_length + support_depth,
                            height = support_depth + e,
                            top_weight_y = 1
                        );
                    }
                }

                difference() {
                    union() {
                        _front_lip_and_lower_sides();
                        _bumper_arms();
                    }
                    _keys_cavity();
                }
            }

            module _engraving(corner_offset = 10) {
                translate([
                    enclosure_width / 2,
                    enclosure_length * .75,
                    engraving_depth
                ]) {
                    rotate([0, 180, 0]) {
                        engraving(
                            height = engraving_depth + e,
                            bleed = tolerance
                        );
                    }
                }
            }

            module _switch_engraving(font_size = 5) {
                x = switch_x - SWITCH_ORIGIN.x - font_size * 2;
                y_gutter = font_size * 1.5;
                y_origin = switch_y - SWITCH_ORIGIN.y + SWITCH_BASE_LENGTH / 2;
                ys = [y_origin - y_gutter / 2, y_origin + y_gutter / 2];

                for (i = [0, 1]) {
                    translate([x, ys[i], -e]) {
                        mirror([1, 0, 0]) {
                            engraving(
                                string = str(i),
                                font = "Work Sans:style=Bold",
                                height = engraving_depth + e,
                                size = font_size,
                                bleed = tolerance
                            );
                        }
                    }
                }
            }

            module _speaker_container() {
                z = enclosure_wall - e;

                inner_diameter = SPEAKER_MAGNET_DIAMETER + tolerance * 2;
                outer_diameter = inner_diameter + enclosure_inner_wall * 2;

                translate([speaker_x, speaker_y, z]) {
                    cylinder(
                        d = inner_diameter + e * 2,
                        h = speaker_z - z
                    );

                    ring(
                        diameter = outer_diameter,
                        height = speaker_z + SPEAKER_MAGNET_HEIGHT - z,
                        inner_diameter = inner_diameter
                    );
                }
            }

            difference() {
                union() {
                    _enclosure_half(false);
                    _keys_bumper();
                    _switch_container();
                    _switch_exposure(
                        xy_bleed = enclosure_inner_wall,
                        include_switch_cavity = false,
                        z_bleed = -e
                    );
                    _battery_container();
                    _mount_stilts_and_spacers();
                    _mounting_rail_aligners();
                    _speaker_container();
                }

                _switch_exposure(
                    xy_bleed = tolerance,
                    include_switch_cavity = true,
                    z_bleed = e
                );
                _switch_engraving();
                _screw_cavities();
                _engraving();
                _pcb(true);
            }

            _screw_head_cavity_bridges();
        }

        module _top() {
            speaker_mounting_plate_z = speaker_z + SPEAKER_HEIGHT;
            speaker_mounting_plate_height = enclosure_wall - engraving_depth;

            module _pcb_window_pane_cavity() {
                translate([
                    window_and_side_panel_gutter,
                    pcb_y + PCB_COMPONENTS_Y - pcb_window_y_extension,
                    enclosure_height - enclosure_wall - e
                ]) {
                    cube([
                        window_pane_width,
                        window_pane_length,
                        enclosure_wall + e * 2
                    ]);
                }
            }

            module _key_mounting_rail() {
                x = enclosure_wall - e;
                y = key_mounting_rail_y;
                z = pcb_z + PCB_HEIGHT + mount_height + cantilever_height;

                difference() {
                    translate([x, y, z]) {
                        mounting_rail(
                            width = enclosure_width - x * 2,
                            length = mount_length,
                            height = enclosure_height - z - enclosure_wall + e,
                            hole_xs = mount_hole_xs,
                            hole_xs_x_offset = keys_x - x,
                            head_hole_diameter = SCREW_HEAD_DIAMETER + tolerance * 2,
                            include_nut_cavity = true,
                            nut_lock_z = 2 // TODO: tighten for shorter screw
                        );
                    }

                    _window_pane(tolerance);
                }
            }

            module _branding(depth = enclosure_wall - 1) {
                font_size = 5.9; // TODO: derive or obviate
                z = enclosure_height - depth;

                translate([side_panel_x, side_panel_y, z]) {
                    // DEBUG to find branding_length
                    * % cube([side_panel_width, branding_length, .1]);

                    engraving(
                        string = "POLY555",
                        font = "Work Sans:style=Bold",
                        height = depth + e,
                        size = font_size * .75,
                        center = false,
                        bleed = tolerance
                    );
                }

                translate([side_panel_x, side_panel_y + 5.5, z]) {
                    engraving(
                        height = depth + e,
                        size = font_size,
                        center = false,
                        bleed = tolerance
                    );
                }
            }

            module _speaker_mounting_plate() {
                overlap = enclosure_wall;

                difference() {
                    translate([
                        side_panel_x - overlap,
                        speaker_grill_y - overlap,
                        speaker_mounting_plate_z
                    ]) {
                        cube([
                            side_panel_width + overlap * 2,
                            speaker_grill_length + overlap * 2,
                            speaker_mounting_plate_height
                        ]);
                    }

                    translate([
                        speaker_x,
                        speaker_y,
                        speaker_mounting_plate_z - e
                    ]) {
                        speaker_face(
                            diameter = SPEAKER_DIAMETER - SPEAKER_RIM_DEPTH,
                            height = speaker_mounting_plate_height + e * 2
                        );
                    }
                }
            }

            module _speaker_grill() {
                difference() {
                    translate([
                        side_panel_x,
                        speaker_grill_y,
                        enclosure_height - enclosure_wall - e
                    ]) {
                        diagonal_grill(
                            side_panel_width, speaker_grill_length, enclosure_wall + e * 2,
                            angle = 60
                        );
                    }
                }
            }

            module _volume_wheel_brace() {
                z = pcb_z + PCB_HEIGHT + POT_HEIGHT + volume_wheel_cap_height;
                width = enclosure_width - enclosure_wall
                    - (pcb_x + PCB_VOLUME_WHEEL_X);
                length = enclosure_inner_wall;
                height = width;

                cone_diameter = volume_wheel_diameter / 2;
                cone_height = cone_diameter / 2;

                translate([
                    enclosure_width - enclosure_wall - width - e,
                    pcb_y + PCB_VOLUME_WHEEL_Y - length / 2,
                    z
                ]) {
                    cube([width, length, cone_height]);

                    translate([0, 0, cone_height]) {
                        flat_top_rectangular_pyramid(
                            top_width = 0,
                            top_length = length,
                            bottom_width = width + e,
                            bottom_length = length,
                            height = height,
                            top_weight_x = 1
                        );
                    }
                }

                translate([
                    pcb_x + PCB_VOLUME_WHEEL_X,
                    pcb_y + PCB_VOLUME_WHEEL_Y,
                    z
                ]) {
                    cylinder(
                        d1 = cone_diameter,
                        d2 = 0,
                        h = cone_height
                    );
                }
            }

            _key_mounting_rail();
            _volume_wheel_brace();
            _speaker_mounting_plate();

            difference() {
                _enclosure_half(true);
                _keys_and_bumper_cavity();
                _pcb_window_pane_cavity();
                _pcb(true);
                _branding();
                _speaker_grill();
                /* TODO: window pane support */
            }
        }

        if (show_just_hinge_parts) {
            assert(
                !show_enclosure_top && !show_enclosure_bottom,
                "Don't show_enclosure_top or show_enclosure_bottom when using show_just_hinge_parts"
            );
            _enclosure_half();
        }

        color(enclosure_color, enclosure_opacity) {
            if (show_enclosure_top) { _top(); }
            if (show_enclosure_bottom) { _bottom(); }
        }
    }

    module _battery() {
        translate([battery_x, battery_y, enclosure_wall + e]) {
            translate([-BATTERY_SNAP_WIDTH, 0, 0]) {
                # cube([BATTERY_SNAP_WIDTH, BATTERY_LENGTH, BATTERY_HEIGHT]);
            }

            battery();
        }
    }

    module _speaker() {
        translate([speaker_x, speaker_y, speaker_z]) {
            speaker();
        }
    }

    module _pcb(
        for_enclosure_cavity = false,
        volume_wheel_grip_size = .6
    ) {
        translate([pcb_x, pcb_y, pcb_z]) {
            pcb(
                visualize_board =  !for_enclosure_cavity,
                visualize_buttons = !for_enclosure_cavity,
                visualize_circuit_space = quick_preview && !for_enclosure_cavity,
                visualize_silkscreen = !quick_preview && !for_enclosure_cavity,
                visualize_switch = show_switch && !for_enclosure_cavity,

                // TODO: improve for assembly by splitting across top and bottom
                visualize_volume_wheel = for_enclosure_cavity || !quick_preview,

                simplify_volume_wheel = for_enclosure_cavity,
                volume_wheel_diameter = for_enclosure_cavity
                    ? volume_wheel_diameter
                        + volume_wheel_grip_size * 2
                        + tolerance * 4
                    : volume_wheel_diameter,
                volume_wheel_grip_size =
                    (quick_preview || for_enclosure_cavity)
                        ? 0
                        : volume_wheel_grip_size,
                volume_wheel_cap_height = for_enclosure_cavity
                    ? volume_wheel_cap_height + tolerance * 4
                    : volume_wheel_cap_height,

                pcb_color = pcb_color,
                opacity = pcb_opacity
            );
        }
    }

    module _mounting_rails() {
        rail_x = enclosure_wall + tolerance * 2;
        rail_y = key_mounting_rail_y;
        rail_z = pcb_z + PCB_HEIGHT;

        rail_width = enclosure_width - rail_x * 2;
        foot_width = pcb_x - rail_x - 1; // extra wide berth around PCB

        difference() {
            translate([rail_x, rail_y, 0]) {
                translate([0, 0, rail_z]) {
                    mounting_rail(
                        width = rail_width,
                        length = mount_length,
                        height = mount_height,
                        hole_xs = mount_hole_xs,
                        hole_xs_x_offset = keys_x - rail_x,
                        head_hole_diameter = SCREW_HEAD_DIAMETER + tolerance * 2
                    );
                }

                for (x = [0, 0 + rail_width - foot_width]) {
                    translate([x, 0, enclosure_wall]) {
                        cube([
                            foot_width,
                            mount_length,
                            rail_z - enclosure_wall + e
                        ]);
                    }
                }
            }

            _mounting_rail_aligners(tolerance * 2);
        }

        translate([e, 0, 0]) _mounted_keys(include_hitch = true);
    }

    // TODO: udpate. these values are wack.
    module _window_pane(xy_bleed = 0, z_bleed = 0) {
        translate([
            window_and_side_panel_gutter - xy_bleed,
            window_pane_y - xy_bleed,
            window_pane_z - z_bleed
        ]) {
            cube([
                window_pane_width + xy_bleed * 2,
                window_pane_length + xy_bleed * 2,
                WINDOW_PANE_HEIGHT + z_bleed * 2
            ]);
        }
    }

    intersection() {
        union() {
            _enclosure();
            if (show_battery) { % _battery(); }
            if (show_speaker) { % _speaker(); }
            if (show_pcb) { % _pcb(); }
            if (show_mounting_rails) { _mounting_rails(); }
            if (show_keys) { _keys(); }
            if (show_window_pane) {
                color(window_pane_color, window_pane_opacity) {
                    _window_pane();
                }
            }
        }

        /* translate([-20, -20, -20]) cube([35, 300, 100]); // switch */
        /* translate([-e, -e, -e]) cube([speaker_x, 300, 100]); */
        /* translate([-e, -10, -e]) cube([enclosure_width / 2, enclosure_length + 20, enclosure_height + 20]); // cross section */
        /* translate([-e, -10, -e]) cube([ pcb_x + PCB_SWITCH_X + SWITCH_BASE_WIDTH / 2 - SWITCH_ORIGIN.x, enclosure_length + 20, enclosure_height + 20 ]); */
        /* translate([pcb_x + PCB_HOLES[2][0], pcb_y + PCB_HOLES[2][1], -e]) cylinder(d = 12, h = 20); */
        /* translate([-e, key_mounting_rail_y - 4, -e]) cube([10, 10, 4]); */
        /* cube([enclosure_width, enclosure_length, 18]); */
    }
}

DEV_MODE = true;

assembly(
    show_enclosure_bottom = true,
    show_battery = true,
    show_speaker = true,
    show_switch = true,
    show_pcb = true,
    show_mounting_rails = true,
    show_keys = true,
    show_enclosure_top = true,
    show_hinge_parts = true,

    quick_preview = DEV_MODE
);
