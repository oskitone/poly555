include <lib/values.scad>;

use <lib/basic_shapes.scad>;
use <lib/battery.scad>;
use <lib/breakaway_support.scad>;
use <lib/diagonal_grill.scad>;
use <lib/enclosure.scad>;
use <lib/engraving.scad>;
use <lib/keys.scad>;
use <lib/mount_stilt.scad>;
use <lib/mounting_rail.scad>;
use <lib/nut_lock.scad>;
use <lib/pcb.scad>;
use <lib/speaker.scad>;
use <lib/supportless_screw_cavity.scad>;
use <lib/switch.scad>;
use <lib/utils.scad>;

module assembly(
    key_gutter = 1,
    accidental_key_recession = 2,
    natural_key_exposed_height = 3,
    accidental_key_extra_height = 3,

    enclosure_wall = 2.4,
    enclosure_floor_ceiling = 1.8,
    enclosure_inner_wall = 1.2,
    enclosure_chamfer = 2,
    enclosure_rounding = 24,

    engraving_depth = 1,

    components_to_window_clearance = 2,
    speaker_to_battery_clearance = .5,
    exposed_screw_head_clearance = .4,

    mount_length = 6,
    cantilever_length = 3,
    cantilever_height = 1,

    tolerance = .1,

    keys_count = 20,
    starting_natural_key_index = 3,
    key_travel = 1.4,

    // Adjust from 0 to 1 to see possible plastic dimensions from manufacturer
    visualized_plastic_tolerance_weight = .5,
    animate_visualized_plastic_tolerance_weight = false,

    volume_wheel_exposure = 2,
    volume_wheel_cap_height = 1,
    volume_wheel_vertical_clearance = .4,

    show_enclosure_bottom = true,
    show_battery = true,
    show_speaker = true,
    show_switch = true,
    show_pcb = true,
    show_volume_wheel = true,
    show_mounting_rails = true,
    show_keys = true,
    show_enclosure_top = true,
    show_window_pane = false,

    enclosure_color = undef,
    enclosure_opacity = .75,
    pcb_color = "purple",
    pcb_opacity = .75,
    natural_key_color = "white",
    accidental_key_color = "black",
    key_opacity = .75,

    quick_preview = false,
    cross_section = undef
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

    window_y_extension = PCB_COMPONENTS_Y - keys_mount_end_on_pcb;
    pcb_x = enclosure_gutter - keys_from_pcb_x_offset;
    pcb_y = mounted_keys_total_length - keys_mount_end_on_pcb + enclosure_gutter;
    pcb_z = enclosure_floor_ceiling + max(
        MOUNT_STILT_MINIMUM_HEIGHT,
        SWITCH_BASE_HEIGHT + SWITCH_ACTUATOR_HEIGHT
            - enclosure_floor_ceiling + exposed_screw_head_clearance
    );
    pcb_stilt_height = pcb_z - enclosure_floor_ceiling;

    enclosure_width = enclosure_gutter * 2 + mount_width;
    enclosure_length = pcb_y + keys_mount_end_on_pcb
        + PCB_COMPONENTS_LENGTH + window_y_extension * 2
        + enclosure_gutter;

    enclosure_height = enclosure_floor_ceiling * 2 + max(
        pcb_stilt_height + PCB_HEIGHT + PCB_COMPONENTS_HEIGHT
            + WINDOW_PANE_HEIGHT + components_to_window_clearance,
        SPEAKER_HEIGHT - SPEAKER_MAGNET_HEIGHT + BATTERY_HEIGHT
            + speaker_to_battery_clearance
    );
    enclosure_bottom_height = pcb_z + PCB_HEIGHT + POT_HEIGHT
        - volume_wheel_cap_height - volume_wheel_vertical_clearance;
    enclosure_top_height = enclosure_height - enclosure_bottom_height;

    key_height = enclosure_height - pcb_stilt_height - enclosure_floor_ceiling
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
    key_mounting_rail_x = enclosure_wall + tolerance * 2;
    key_mounting_rail_y = pcb_y + keys_mount_end_on_pcb - mount_length;

    battery_x = enclosure_width - BATTERY_WIDTH - enclosure_wall - tolerance;
    battery_y = enclosure_length - enclosure_wall - BATTERY_LENGTH - tolerance;

    switch_x = pcb_x + PCB_SWITCH_X;
    switch_y = pcb_y + PCB_SWITCH_Y;
    switch_z = pcb_z;
    switch_exposure_height = switch_z - SWITCH_BASE_HEIGHT;

    window_and_side_panel_gutter = enclosure_gutter - key_gutter;

    window_cavity_width = PCB_COMPONENTS_WIDTH +
        ((pcb_x + PCB_COMPONENTS_X) - window_and_side_panel_gutter) * 2;
    window_cavity_length = PCB_COMPONENTS_LENGTH + window_y_extension * 2;
    window_cavity_y = pcb_y + PCB_COMPONENTS_Y - window_y_extension;

    // Pane dimensions are average between +/- PLASTICS_TOLERANCE
    window_pane_x = enclosure_wall + tolerance;
    window_pane_y = pcb_y + keys_mount_end_on_pcb - tolerance
        - (mount_length - PCB_MOUNT_HOLE_DIAMETER) / 2;
    window_pane_z = enclosure_height - enclosure_floor_ceiling
        - WINDOW_PANE_HEIGHT;
    window_pane_max_width = window_cavity_width + window_pane_x * 2;
    window_pane_width = window_pane_max_width - PLASTICS_TOLERANCE;
    window_pane_max_length = enclosure_length - enclosure_wall - window_pane_y
        - tolerance;
    window_pane_length = window_pane_max_length - PLASTICS_TOLERANCE;
    window_pane_strut_width = window_pane_width / 4;

    side_panel_width = enclosure_width
        - window_and_side_panel_gutter * 3
        - window_cavity_width;
    side_panel_x = enclosure_width - side_panel_width - window_and_side_panel_gutter;
    side_panel_y = key_mounting_rail_y + mount_length;
    side_panel_length = enclosure_length - enclosure_gutter - side_panel_y;

    volume_wheel_diameter = volume_wheel_exposure +
        (enclosure_width - (pcb_x + PCB_VOLUME_WHEEL_X)) * 2;

    branding_length = ((pcb_y + PCB_LED_Y) - side_panel_y) * 2;
    speaker_grill_length = side_panel_length - branding_length - enclosure_gutter;
    speaker_grill_y = side_panel_y + side_panel_length - speaker_grill_length;

    speaker_x = side_panel_x + side_panel_width / 2;
    speaker_y = speaker_grill_y + (speaker_grill_length - SPEAKER_LENGTH) / 2
        + SPEAKER_LENGTH / 2;
    speaker_z = enclosure_height - enclosure_floor_ceiling - SPEAKER_HEIGHT;

    aligner_width = enclosure_inner_wall;

    echo("Enclosure dimensions", [enclosure_width, enclosure_length, enclosure_height]);
    echo("Window cavity dimensions", [window_cavity_width, window_cavity_length]);
    echo("Window pane dimensions", window_pane_width, window_pane_length);

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

                include_mount = false,
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

    module _mount() {
        difference() {
            translate([key_mounting_rail_x, key_mounting_rail_y, keys_z]) {
                mounting_rail(
                    enclosure_width - key_mounting_rail_x * 2,
                    mount_length,
                    cantilever_height,
                    hole_xs = mount_hole_xs,
                    hole_xs_x_offset = pcb_x - key_mounting_rail_x + key_gutter
                );
            }

            _mounting_rail_aligners(tolerance * 2);
        }
    }

    module _keys() {
        color(natural_key_color, key_opacity) {
            _mounted_keys(include_natural = true);
            _mount();
        }
        color(accidental_key_color, key_opacity) {
            _mounted_keys(include_accidental = true);
        }
    }

    module _mounting_rail_aligners(bleed = 0) {
        width = aligner_width + bleed;
        length = mount_length / 2 + bleed * 2;
        height = keys_z - enclosure_floor_ceiling + cantilever_height;

        y = key_mounting_rail_y + (mount_length - length) / 2;
        z = enclosure_floor_ceiling - e;

        for (x = [
            enclosure_wall - e,
            enclosure_width - enclosure_wall - width
        ]) {
            translate([x, y, z]) {
                cube([
                    width,
                    length,
                    height + e * 2
                ]);
            }
        }
    }

    module _enclosure() {
        keys_exposed_height = accidental_key_extra_height
            + natural_key_exposed_height;
        bumper_length = keys_cavity_length + enclosure_gutter - key_gutter
             - tolerance * 2;

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
                    floor_ceiling = enclosure_floor_ceiling,

                    add_lip = !is_top,
                    remove_lip = is_top,

                    include_tongue_and_groove = !quick_preview,
                    tongue_and_groove_end_length = enclosure_wall * 2,

                    radius = quick_preview ? 0 : enclosure_chamfer,
                    tolerance = tolerance,

                    $fn = enclosure_rounding
                );
            }
        }

        module _volume_wheel_flank_wall(x_bleed = 0, z_bleed = 0) {
            x = enclosure_width - enclosure_wall - x_bleed;
            y = key_mounting_rail_y - tolerance * 2 - e;

            translate([x, y, enclosure_bottom_height - z_bleed]) {
                cube([
                    enclosure_wall + x_bleed * 2,
                    pcb_y + PCB_VOLUME_WHEEL_Y - y,
                    get_volume_wheel_total_height(
                        cap_height = volume_wheel_cap_height
                    ) + volume_wheel_vertical_clearance * 2 + z_bleed
                ]);
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
                length = enclosure_inner_wall,
                height = BATTERY_HEIGHT * .5
            ) {
                translate([
                    side_panel_x + (side_panel_width - width) / 2,
                    battery_y - length - tolerance,
                    enclosure_floor_ceiling
                ]) {
                    cube([width, length, height]);
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
                        enclosure_floor_ceiling - e
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

                translate([pcb_x, pcb_y, enclosure_floor_ceiling - e]) {
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

                        translate([
                            pcb_x + p.x,
                            pcb_y + p.y,
                            SCREW_HEAD_HEIGHT + exposed_screw_head_clearance - e
                        ]) {
                            supportless_screw_cavity(span = diameter);
                        }
                    }
                }

                _heads();
            }

            module _engraving(corner_offset = 10) {
                translate([
                    enclosure_width / 2,
                    enclosure_length * .75,
                    engraving_depth
                ]) {
                    rotate([0, 180, 0]) {
                        engraving(
                            string = "OSKITONE",
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

            // TODO: make a lil taller for tighter fit
            module _speaker_container(wall = enclosure_wall, spoke_count = 3) {
                z = enclosure_floor_ceiling - e;

                inner_diameter = SPEAKER_MAGNET_DIAMETER + tolerance * 2;
                outer_diameter = inner_diameter + wall * 2;
                height = speaker_z + SPEAKER_MAGNET_HEIGHT - z;

                spoke_length =
                    (SPEAKER_CONE_DIAMETER - SPEAKER_MAGNET_DIAMETER) / 2;
                ring_segment_width = (inner_diameter * PI) / spoke_count / 2;

                translate([speaker_x, speaker_y, z]) {
                    ring(
                        diameter = outer_diameter,
                        height = height,
                        inner_diameter = inner_diameter,
                        $fn = HIDEF_ROUNDING
                    );

                    for (i = [0 : spoke_count - 1]) {
                        rotate([0, 0, 180 + i / spoke_count * 360]) {
                            translate([wall / -2, inner_diameter / 2, 0]) {
                                cube([wall, spoke_length + e, height]);
                            }
                        }
                    }
                }
            }

            module _window_pane_stilts(width = 15) {
                z = pcb_z + PCB_HEIGHT;

                height = window_pane_z - z;
                length = enclosure_length - enclosure_wall
                    - window_cavity_y - window_cavity_length
                    - tolerance;
                vault_height = length;

                plot = (window_cavity_width - window_pane_strut_width) / 2;

                module _stilt() {
                    translate([0, length, 0]) {
                        flat_top_rectangular_pyramid(
                            top_width = width,
                            top_length = length + e,
                            bottom_width = width,
                            bottom_length = 0,
                            height = vault_height + e,
                            top_weight_y = 1
                        );
                    }

                    translate([0, 0, vault_height]) {
                        cube([width, length + e, height - vault_height]);
                    }
                }

                for (x = [
                    window_and_side_panel_gutter + (plot - width) / 2,
                    window_and_side_panel_gutter + plot
                        + window_pane_strut_width + (plot - width) / 2,
                ]) {
                    translate([
                        x,
                        enclosure_length - enclosure_wall - length,
                        z
                    ]) {
                        _stilt();
                    }
                }
            }

            module _back() {
                length = enclosure_length - bumper_length;
                overlap = enclosure_wall + e;

                intersection() {
                    translate([0, enclosure_length - (length + overlap), 0]) {
                        _enclosure_half(
                            is_top = false,
                            length = (length + overlap)
                        );
                    }

                    translate([-e, enclosure_length - length, -e]) {
                        cube([
                            enclosure_width + e * 2,
                            length + e,
                            enclosure_height + e * 2
                        ]);
                    }
                }
            }

            module _front() {
                overlap = enclosure_wall + e;
                keys_cavity_xy = enclosure_gutter - key_gutter;

                lip_cavity_height = keys_exposed_height + accidental_key_recession;

                module _enclosure_inner_cavity() {
                    keys_exposed_width = enclosure_width - keys_cavity_xy * 2;
                    keys_exposed_length = bumper_length - enclosure_wall;

                    bottom_width = enclosure_width - enclosure_wall * 2;
                    bottom_length = bumper_length + (keys_cavity_xy - enclosure_wall)
                        - enclosure_wall;

                    lip_vault_height = bottom_length - keys_exposed_length;

                    lip_cavity_height = keys_exposed_height + accidental_key_recession;

                    vault_height = (bottom_width - keys_exposed_width) / 2;
                    vault_z = enclosure_height - lip_cavity_height - vault_height;

                    translate([
                        enclosure_wall,
                        enclosure_wall,
                        enclosure_floor_ceiling
                    ]) {
                        cube([
                            bottom_width,
                            bottom_length,
                            vault_z - enclosure_floor_ceiling + e
                        ]);
                    }

                    translate([enclosure_wall, enclosure_wall, vault_z]) {
                        flat_top_rectangular_pyramid(
                            top_width = keys_exposed_width,
                            top_length = keys_exposed_length,
                            bottom_width = bottom_width,
                            bottom_length = bottom_length,
                            height = vault_height,
                            top_weight_y = 1
                        );
                    }

                    translate([
                        keys_cavity_xy,
                        keys_cavity_xy,
                        vault_z + vault_height - e
                    ]) {
                        cube([
                            keys_exposed_width,
                            keys_exposed_length,
                            enclosure_height - vault_z - vault_height + e * 2
                        ]);
                    }
                }

                module _front_key_exposure_lip_cavity() {
                    translate([keys_cavity_xy, -e, enclosure_height - lip_cavity_height]) {
                        cube([
                            enclosure_width - keys_cavity_xy * 2,
                            keys_cavity_xy + e * 2,
                            lip_cavity_height + e
                        ]);
                    }

                    if (!quick_preview) {
                        translate([
                            keys_cavity_xy,
                            enclosure_chamfer,
                            enclosure_height - lip_cavity_height - enclosure_chamfer
                        ]) {
                            rotate([0, 90, 0]) {
                                rounded_corner_cutoff(
                                    height = enclosure_width - keys_cavity_xy * 2,
                                    angle = 180,
                                    radius = enclosure_chamfer,
                                    e = e,
                                    $fn = enclosure_rounding
                                );
                            }
                        }
                    }
                }

                difference() {
                    intersection() {
                        rounded_cube(
                            [
                                enclosure_width,
                                bumper_length + overlap,
                                enclosure_height
                            ],
                            quick_preview ? 0 : enclosure_chamfer,
                            $fn = enclosure_rounding
                        );

                        translate([-e, -e, -e]) {
                            cube([
                                enclosure_width + e * 2,
                                bumper_length + e,
                                enclosure_height + e * 2
                            ]);
                        }
                    }

                    _enclosure_inner_cavity();
                    _front_key_exposure_lip_cavity();
                }
            }

            difference() {
                union() {
                    _back();
                    _front();
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
                    _window_pane_stilts();
                    _volume_wheel_flank_wall();
                }

                _switch_exposure(
                    xy_bleed = tolerance,
                    include_switch_cavity = true,
                    z_bleed = e
                );
                _switch_engraving();
                _screw_cavities();
                _engraving();
                _pcb(for_enclosure_cavity = true);
            }
        }

        module _top() {
            speaker_mounting_plate_z = speaker_z + SPEAKER_HEIGHT;
            speaker_mounting_plate_height = enclosure_floor_ceiling - engraving_depth;

            led_cavity_width = branding_length * .67;

            module _window_cavity() {
                translate([
                    window_and_side_panel_gutter,
                    window_cavity_y,
                    enclosure_height - enclosure_floor_ceiling - e
                ]) {
                    cube([
                        window_cavity_width,
                        window_cavity_length,
                        enclosure_floor_ceiling + e * 2
                    ]);
                }
            }

            module _key_mounting_rail() {
                wall_length = enclosure_wall;

                x = enclosure_wall - e;
                y = key_mounting_rail_y;
                z = pcb_z + PCB_HEIGHT + mount_height + cantilever_height;

                nut_lock_floor = enclosure_floor_ceiling;

                sill_height = enclosure_wall;
                wall_height = enclosure_height - z - enclosure_floor_ceiling + e;

                rail_height = nut_lock_floor + NUT_HEIGHT;
                rail_support_length = mount_length - wall_length;

                module _wall() {
                    translate([x, y, z + rail_height - e]) {
                        cube([
                            enclosure_width - x * 2,
                            wall_length,
                            wall_height - rail_height + e
                        ]);
                    }
                }

                module _rail() {
                    x = enclosure_wall - e;
                    rail_width = enclosure_width - x * 2;

                    clearance = aligner_width + tolerance * 4;
                    clearance_height = enclosure_top_height - z
                        - LIP_BOX_DEFAULT_LIP_HEIGHT;

                    translate([x + clearance, y, z]) {
                        cube([
                            rail_width - clearance * 2,
                            mount_length,
                            clearance_height + e
                        ]);
                    }

                    translate([x, y, z + clearance_height]) {
                        cube([
                            rail_width,
                            mount_length,
                            rail_height - clearance_height
                        ]);
                    }

                    translate([x, y + wall_length, z + rail_height - e]) {
                        flat_top_rectangular_pyramid(
                            top_width = rail_width,
                            top_length = 0,
                            bottom_width = rail_width,
                            bottom_length = rail_support_length,
                            height = rail_support_length,
                            top_weight_y = 0
                        );
                    }
                }

                module _screw_and_nut_lock_cavities($fn = DEFAULT_ROUNDING) {
                    translate([keys_x, y + mount_length / 2, z - e]) {
                        hole_array(
                            xs = mount_hole_xs,
                            diameter = PCB_MOUNT_HOLE_DIAMETER,
                            height = wall_height - WINDOW_PANE_HEIGHT
                                - sill_height - e
                        );

                        for (x = mount_hole_xs) {
                            translate([x, 0, nut_lock_floor + e]) {
                                nut_lock(
                                    include_supportless_screw_cavity = true,
                                    flip_supportless_screw_cavity = true
                                );
                            }
                        }
                    }
                }

                module _window_pane_sill() {
                    sill_width = window_pane_max_width + tolerance * 4;

                    sill_x = window_pane_x - tolerance * 2;
                    sill_y = y + wall_length - e;
                    sill_z = window_pane_z - sill_height;

                    supports_count =
                        round(sill_width / BREAKAWAY_SUPPORT_DISTANCE);
                    support_plot = sill_width / supports_count;

                    translate([sill_x, sill_y, sill_z]) {
                        cube([
                            sill_width + aligner_width,
                            mount_length - wall_length + e,
                            sill_height
                        ]);
                    }

                    for (i = [1 : supports_count - 1]) {
                        translate([
                            sill_x + i * support_plot
                                - BREAKAWAY_SUPPORT_DEPTH / 2,
                            sill_y - e,
                            window_pane_z - e
                        ]) {
                            breakaway_support(
                                length = rail_support_length + e,
                                height = WINDOW_PANE_HEIGHT + e * 2,
                                flip_vertically = true,
                                include_first = false
                            );
                        }
                    }
                }

                _window_pane_sill();

                difference() {
                    union() {
                        _wall();
                        _rail();
                    }

                    _screw_and_nut_lock_cavities();
                }
            }

            module _led_exposure(bleed = 0, z_bleed = 0) {
                z = pcb_z + PCB_HEIGHT - z_bleed;
                height = enclosure_height - z + z_bleed;

                difference() {
                    hull() {
                        translate([
                            side_panel_x + led_cavity_width / 2,
                            side_panel_y + branding_length / 2,
                            z
                        ]) {
                            cylinder(d = LED_DIAMETER + bleed * 2, h = e);
                        }

                        translate([
                            side_panel_x - bleed,
                            side_panel_y - bleed,
                            z + height - e
                        ]) {
                            cube([
                                led_cavity_width + bleed * 2,
                                branding_length + bleed * 2,
                                e
                            ]);
                        }
                    }
                }
            }

            module _branding_cavities(
                line_gutter = enclosure_gutter / 4,
                led_gutter = enclosure_gutter / 2,
                chamfer = .2
            ) {
                branding_width = side_panel_width - led_cavity_width
                    - led_gutter;

                branding_x = side_panel_x + side_panel_width - branding_width;

                oskitone_length_width_ratio = 4.6265526 / 29.757366;
                brand_size = branding_width * oskitone_length_width_ratio;
                model_size = branding_length - line_gutter - brand_size;

                translate([
                    branding_x,
                    side_panel_y,
                    enclosure_height - engraving_depth
                ]) {
                    translate([0, branding_length - brand_size, 0]) {
                        engraving(
                            svg = "../../branding.svg",
                            height = engraving_depth + e,
                            size = [branding_width, brand_size],
                            center = false,
                            bleed = -tolerance,
                            chamfer = quick_preview ? 0 : chamfer
                        );
                    }

                    engraving(
                        string = "POLY555",
                        font = "Orbitron:style=Black",
                        size = model_size,
                        height = engraving_depth + e,
                        center = false,
                        bleed = -tolerance,
                        chamfer = quick_preview ? 0 : chamfer
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
                        enclosure_height - enclosure_floor_ceiling - e
                    ]) {
                        diagonal_grill(
                            side_panel_width, speaker_grill_length, enclosure_floor_ceiling + e * 2,
                            angle = 60
                        );
                    }
                }
            }

            module _volume_wheel_brace() {
                z = get_volume_wheel_z(volume_wheel_cap_height, pcb_z)
                    + get_volume_wheel_total_height(volume_wheel_cap_height);
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

            module _window_pane_top_supports() {
                module _struts(
                    count = 1,
                    width = window_pane_strut_width,
                    overlap = .5,
                    z_tightness = .5
                ) {
                    plot = window_pane_max_width / count;
                    y = enclosure_length - enclosure_wall;
                    length = y - (window_pane_y + window_pane_length)
                        + overlap;
                    z = enclosure_height - enclosure_floor_ceiling
                        - WINDOW_PANE_HEIGHT - length
                        + z_tightness;

                    for (i = [0 : count - 1]) {
                        x = window_pane_x + plot * i + (plot - width) / 2;

                        intersection() {
                            translate([x, y, z]) {
                                rotate([0, 90, 0]) {
                                    cylinder(
                                        d = length * 2,
                                        h = width,
                                        $fn = 4
                                    );
                                }
                            }

                            translate([x - e, y - length - e, z - length - e]) {
                                cube([
                                    width + e * 2,
                                    length + e * 2,
                                    length * 2 + e * 2
                                ]);
                            }
                        }
                    }
                }

                module _aligner() {
                    y = key_mounting_rail_y + e;
                    length = enclosure_length - y - e;

                    x = window_pane_x + window_pane_max_width + tolerance;
                    z = enclosure_height - enclosure_floor_ceiling
                        - WINDOW_PANE_HEIGHT;

                    translate([x, y, z]) {
                        cube([aligner_width, length, WINDOW_PANE_HEIGHT + e]);
                    }
                }

                _struts();
                _aligner();
            }

            _key_mounting_rail();
            _volume_wheel_brace();
            _speaker_mounting_plate();
            _window_pane_top_supports();

            difference() {
                union() {
                    _enclosure_half(true);
                    _led_exposure(enclosure_inner_wall, -e);
                }
                _keys_and_bumper_cavity();
                _window_cavity();
                _pcb(for_enclosure_cavity = true);
                _branding_cavities();
                _led_exposure(tolerance, e, $fn = HIDEF_ROUNDING);
                _speaker_grill();
                _volume_wheel_flank_wall(x_bleed = e, z_bleed = e);
            }
        }

        color(enclosure_color, enclosure_opacity) {
            if (show_enclosure_top) { _top(); }
            if (show_enclosure_bottom) { _bottom(); }
        }
    }

    module _battery() {
        translate([battery_x, battery_y, enclosure_floor_ceiling + e]) {
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
        just_volume_wheel = false,
        volume_wheel_grip_size = 1.5
    ) {
        show_pcb = just_volume_wheel ? false : show_pcb;

        translate([pcb_x, pcb_y, pcb_z]) {
            pcb(
                visualize_board =  !for_enclosure_cavity && show_pcb,
                visualize_buttons = !for_enclosure_cavity && show_pcb,
                visualize_circuit_space = quick_preview && !for_enclosure_cavity,
                visualize_silkscreen = !quick_preview && !for_enclosure_cavity
                     && show_pcb,
                visualize_switch = show_switch && !for_enclosure_cavity,
                visualize_volume_wheel =
                    just_volume_wheel || for_enclosure_cavity,

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
                    ? volume_wheel_cap_height + volume_wheel_vertical_clearance
                        + e
                    : volume_wheel_cap_height,

                pcb_color = pcb_color,
                opacity = pcb_opacity
            );
        }
    }

    module _mounting_rails() {
        difference() {
            translate([
                key_mounting_rail_x,
                key_mounting_rail_y,
                pcb_z + PCB_HEIGHT
            ]) {
                mounting_rail(
                    width = enclosure_width - key_mounting_rail_x * 2,
                    length = mount_length,
                    height = mount_height,
                    hole_xs = mount_hole_xs,
                    hole_xs_x_offset = keys_x - key_mounting_rail_x
                );
            }

            _mounting_rail_aligners(tolerance * 2);
        }

        translate([e, 0, 0]) _mounted_keys(include_hitch = true);
    }

    module _window_pane() {
        weight = animate_visualized_plastic_tolerance_weight
            ? abs(($t - .5) * 2)
            : visualized_plastic_tolerance_weight;

        bleed = PLASTICS_TOLERANCE * 2 * weight - PLASTICS_TOLERANCE;

        translate([
            window_pane_x + PLASTICS_TOLERANCE * (1 - weight),
            window_pane_y + PLASTICS_TOLERANCE * (1 - weight),
            window_pane_z
        ]) {
            cube([
                window_pane_width + bleed,
                window_pane_length + bleed,
                WINDOW_PANE_HEIGHT
            ]);
        }
    }

    intersection() {
        union() {
            _enclosure();
            if (show_battery) { % _battery(); }
            if (show_speaker) { % _speaker(); }
            if (show_pcb) { % _pcb(); }
            if (show_volume_wheel) { _pcb(just_volume_wheel = true); }
            if (show_mounting_rails) { _mounting_rails(); }
            if (show_keys) { _keys(); }
            if (show_window_pane) { % _window_pane();}
        }

        if (cross_section == "speaker") {
            cube([speaker_x, enclosure_length, enclosure_height]);
        } else if (cross_section == "width") {
            cube([enclosure_width / 2, enclosure_length, enclosure_height]);
        } else if (cross_section == "length") {
            cube([enclosure_width, enclosure_length / 2, enclosure_height]);
        } else if (cross_section == "switch") {
            cube([
                pcb_x + PCB_SWITCH_X + SWITCH_BASE_WIDTH / 2 - SWITCH_ORIGIN.x,
                enclosure_length,
                enclosure_height
            ]);
        } else if (cross_section == "pane_cavity") {
            x = 1.8;
            z = enclosure_height - enclosure_floor_ceiling - WINDOW_PANE_HEIGHT
                - 1;

            translate([x, key_mounting_rail_y, z]) {
                cube([41.8 - x, mount_length + e * 2, enclosure_height - z + e]);
            }
        } else if (cross_section == "led") {
            cube([side_panel_x + branding_length / 2, enclosure_length, enclosure_height]);
        }
    }
}

DEV_MODE = true;

assembly(
    show_enclosure_bottom = true,
    show_battery = true,
    show_speaker = true,
    show_switch = true,
    show_pcb = true,
    show_volume_wheel = true,
    show_mounting_rails = true,
    show_keys = true,
    show_enclosure_top = true,

    show_window_pane = false,
    animate_visualized_plastic_tolerance_weight = false,

    quick_preview = DEV_MODE,
    cross_section = undef
);
