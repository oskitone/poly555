include <config.scad>;
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
use <lib/pencil_stand.scad>;
use <lib/screw_head_exposures.scad>;
use <lib/speaker.scad>;
use <lib/switch.scad>;
use <lib/utils.scad>;

module poly555(
    key_gutter = 1,
    accidental_key_recession = 2,
    natural_key_exposed_height = 3,
    accidental_key_extra_height = 3,

    enclosure_wall = 2.4,
    enclosure_floor_ceiling = 1.8,
    enclosure_inner_wall = 1.2,
    enclosure_minimum_wall = .6,
    enclosure_fillet = 2,
    enclosure_rounding = 24,
    enclosure_lip = .8,
    enclosure_lip_height = LIP_BOX_DEFAULT_LIP_HEIGHT,
    enclosure_lip_clearance = .2,

    engraving_depth = .8,
    engraving_chamfer = .2,

    components_to_window_clearance = 2,
    speaker_to_battery_clearance = .4,
    exposed_switch_clearance = 1,
    exposed_screw_head_clearance = .4,

    mount_length = 6,
    cantilever_length = 3,
    cantilever_mount_height = 3,
    cantilever_height = 1,

    tolerance = .1,

    keys_count = 20,
    starting_natural_key_index = 3,
    key_travel = 2, // TODO: refine

    // Adjust from 0 to 1 to see possible plastic dimensions from manufacturer
    visualized_plastic_tolerance_weight = .5,
    animate_visualized_plastic_tolerance_weight = false,

    volume_wheel_exposure = 1,
    volume_wheel_cap_height = 1,
    volume_wheel_grip_size = 1.5,
    volume_wheel_vertical_clearance = .4,
    volume_wheel_brace_clearance = .2,

    pencil_stand_display_angle = 65,
    use_pencil_stand_display_angle = true,

    show_enclosure_bottom = true,
    show_battery = true,
    show_speaker = true,
    show_switch = true,
    show_pcb = true,
    show_volume_wheel = true,
    show_mounting_rail = true,
    show_keys = true,
    show_enclosure_top = true,
    show_window_pane = false,
    show_pencil_stand_pencil = true,

    enclosure_color = undef,
    enclosure_opacity = .75,
    pcb_color = "purple",
    pcb_opacity = .75,
    natural_key_color = "white",
    accidental_key_color = "black",
    key_opacity = .75,

    quick_preview = false,
    cross_section = undef,
    echo_dimensions = true,
    flip_vertically = false,
    reduced_test_case = false
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
            - enclosure_floor_ceiling + exposed_switch_clearance
    );
    pcb_stilt_height = pcb_z - enclosure_floor_ceiling;

    enclosure_width = reduced_test_case
        ? 30 // arbitrary
        : enclosure_gutter * 2 + mount_width;
    enclosure_length = pcb_y + keys_mount_end_on_pcb
        + PCB_COMPONENTS_LENGTH + window_y_extension * 2
        + enclosure_gutter;

    enclosure_height = enclosure_floor_ceiling * 2 + max(
        pcb_stilt_height + PCB_HEIGHT + PCB_COMPONENTS_HEIGHT
            + WINDOW_PANE_HEIGHT + components_to_window_clearance,
        SPEAKER_HEIGHT - SPEAKER_MAGNET_HEIGHT + BATTERY_HEIGHT
            + speaker_to_battery_clearance
    );
    enclosure_bottom_height =
        get_volume_wheel_z(
            cap_height = volume_wheel_cap_height,
            pcb_z = pcb_z,
            pcb_height = PCB_HEIGHT,
            pot_height = POT_HEIGHT,
            head_height = TRIMPOT_KNOB_HEAD_HEIGHT
        )
        + get_volume_wheel_total_height(volume_wheel_cap_height)
        + volume_wheel_vertical_clearance;
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

    side_panel_width = enclosure_width
        - window_and_side_panel_gutter * 3
        - window_cavity_width;
    side_panel_x = enclosure_width - side_panel_width - window_and_side_panel_gutter;
    side_panel_y = key_mounting_rail_y + mount_length;
    side_panel_length = enclosure_length - enclosure_gutter - side_panel_y;

    volume_wheel_diameter = (enclosure_width - (pcb_x + PCB_VOLUME_WHEEL_X)) * 2;

    branding_length = ((pcb_y + PCB_LED_Y) - side_panel_y) * 2;
    speaker_grill_length = side_panel_length - branding_length - enclosure_gutter;
    speaker_grill_y = side_panel_y + side_panel_length - speaker_grill_length;

    speaker_x = side_panel_x + side_panel_width / 2;
    speaker_y = speaker_grill_y + (speaker_grill_length - SPEAKER_LENGTH) / 2
        + SPEAKER_LENGTH / 2;
    speaker_z = enclosure_height - enclosure_floor_ceiling - SPEAKER_HEIGHT;

    aligner_width = enclosure_inner_wall;

    if (echo_dimensions) {
        echo(
            "Enclosure dimensions",
            [enclosure_width, enclosure_length, enclosure_height]
        );
        echo(
            "Window cavity dimensions",
            [window_cavity_width, window_cavity_length]
        );
        echo(
            "Window pane dimensions",
            [window_pane_width, window_pane_length]
        );
    }

    module _keys_hitch_endstop(
        clearance = .4,
        coverage = 2,
        bar_height = 1,

        cavity = false,
        cavity_key_floor = 2,
        cavity_clearance = tolerance * 4 // intentionally loose
    ) {
        xy = enclosure_wall - e;
        bar_z = keys_z + cavity_key_floor;

        width = enclosure_width - xy * 2;
        length = keys_y + coverage - xy + (cavity ? cavity_clearance : 0);
        height = cavity ? bar_height + key_travel : bar_height;

        translate([xy, xy, bar_z - length]) {
            flat_top_rectangular_pyramid(
                top_width = width,
                top_length = length,
                bottom_width = width,
                bottom_length = 0,
                height = length + e,
                top_weight_y = 0
            );
        }

        translate([xy, xy, bar_z]) {
            cube([width, length, height]);
        }

        translate([xy, xy, bar_z + height - e]) {
            flat_top_rectangular_pyramid(
                top_width = width,
                top_length = 0,
                bottom_width = width,
                bottom_length = length,
                height = length + e,
                top_weight_y = 0
            );
        }
    }

    module _mounted_keys(include_natural = false, include_accidental = false) {
        function get_actuator_y(i) = pcb_y + PCB_BUTTONS[i][1] - keys_y
            + BUTTON_LENGTH / 2;

        difference() {
            translate([keys_x, keys_y, keys_z]) {
                mounted_keys(
                    count = keys_count,
                    starting_natural_key_index = starting_natural_key_index,

                    natural_width = natural_key_width,
                    natural_length = natural_key_length,
                    natural_height = key_height,

                    accidental_width = 7.5,
                    accidental_length = natural_key_length * 3/5,
                    accidental_height = key_height
                        + accidental_key_extra_height,

                    natural_actuator_y = get_actuator_y(0),
                    accidental_actuator_y = get_actuator_y(1),

                    front_fillet = quick_preview ? 0 : 2,
                    sides_fillet = quick_preview ? 0 : 1,

                    gutter = key_gutter,

                    cantilever_length = cantilever_length,
                    cantilever_height = cantilever_height,
                    cantilever_recession = cantilever_recession,

                    include_mount = false,
                    include_natural = include_natural,
                    include_accidental = include_accidental
                );
            }

            _keys_hitch_endstop(cavity = true);
        }
    }

    module _keys() {
        module _mount() {
            difference() {
                translate([key_mounting_rail_x, key_mounting_rail_y, keys_z]) {
                    mounting_rail(
                        enclosure_width - key_mounting_rail_x * 2,
                        mount_length,
                        cantilever_mount_height,
                        hole_xs = mount_hole_xs,
                        hole_xs_x_offset = pcb_x - key_mounting_rail_x
                            + key_gutter,
                        hole_diameter = PCB_MOUNT_HOLE_DIAMETER + tolerance * 2
                    );
                }

                _mounting_rail_aligners(cavity = true);
            }
        }

        color(natural_key_color, key_opacity) {
            _mounted_keys(include_natural = true);
            _mount();
        }
        color(accidental_key_color, key_opacity) {
            _mounted_keys(include_accidental = true);
        }
    }

    module _mounting_rail_aligners(cavity = false) {
        bleed = cavity ? tolerance * 2 : 0;
        width = aligner_width + bleed;
        length = mount_length / 2 + bleed * 2;

        y = key_mounting_rail_y + (mount_length - length) / 2;
        z = enclosure_floor_ceiling - e;

        height = cavity
            ? keys_z - enclosure_floor_ceiling + cantilever_mount_height
            : enclosure_bottom_height + enclosure_lip_height - z;

        for (x = [
            enclosure_wall - e,
            enclosure_width - enclosure_wall - width
        ]) {
            translate([x, y, z]) {
                cube([
                    width,
                    length,
                    cavity ? height + e * 2 : height
                ]);
            }
        }
    }

    module _enclosure(show_enclosure_bottom, show_enclosure_top) {
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
                    lip = enclosure_lip,
                    lip_height = is_top
                        ? enclosure_lip_height + enclosure_lip_clearance
                        : enclosure_lip_height,

                    fillet = quick_preview ? 0 : enclosure_fillet,
                    tolerance = tolerance,

                    $fn = enclosure_rounding
                );
            }
        }

        module _keys_and_bumper_cavity(length_adjustment = 0) {
            z = enclosure_bottom_height - enclosure_lip_height - e;

            translate([-e, -e, z]) {
                cube([
                    enclosure_width + e * 2,
                    keys_and_bumper_cavity_length + length_adjustment,
                    enclosure_height - z + e
                ]);
            }
        }

        module _hitch_stilts(
            cavity = false,
            width = BREAKAWAY_SUPPORT_DISTANCE * 2,
            width_extension = enclosure_inner_wall / 2,
            hitch_height = BREAKAWAY_SUPPORT_DISTANCE * .67,
            length_tolerance_clearance = tolerance * 4,
            cavity_width_clearance = tolerance * 4,
            bridge_sag_clearance = .8
        ) {
            total_width = width + width_extension * 2;

            vault_z = enclosure_floor_ceiling + BATTERY_HEIGHT;

            height = window_pane_z - vault_z;
            length = enclosure_length - enclosure_wall
                - window_cavity_y - window_cavity_length;
            vault_height = enclosure_bottom_height + enclosure_lip_height
                - vault_z;

            module _hitch() {
                _width = cavity ? width + cavity_width_clearance : width;
                _length = cavity
                    ? enclosure_wall + e * 3
                    : enclosure_wall + length_tolerance_clearance + e;
                _height = cavity
                    ? hitch_height + bridge_sag_clearance
                    : hitch_height;

                module _supports() {
                    depth = .6;
                    height = cavity
                        ? hitch_height + bridge_sag_clearance
                        : vault_z + height - hitch_height
                            - enclosure_bottom_height;
                    count = ceil(width / BREAKAWAY_SUPPORT_DISTANCE);

                    y = cavity ? 0 : -length_tolerance_clearance;
                    z = cavity ? 0 : -height;

                    for (i = cavity ? [1 : count - 1] : [0 : count]) {
                        x = depth / 2
                            + (i * (width - depth) / count)
                            + (cavity ? cavity_width_clearance / 2 : 0);

                        translate([x, y, z]) {
                            breakaway_support(
                                length = _length,
                                height = height + e,
                                flip_vertically = true,
                                support_depth = depth,
                                bridge_height = SACRIFICIAL_BRIDGE_HEIGHT * 1.5,
                                include_first = cavity
                            );
                        }
                    }
                }

                translate([
                    0,
                    cavity ? -e : -length_tolerance_clearance,
                    cavity ? -bridge_sag_clearance : 0
                ]) {
                    difference() {
                        cube([_width, _length, _height]);
                        if (cavity) { _supports(); }
                    }
                }

                if (!cavity) {
                    _supports();
                }
            }

            module _stilt() {
                if (!cavity) {
                    translate([-width_extension, length, 0]) {
                        flat_top_rectangular_pyramid(
                            top_width = total_width,
                            top_length = length + e,
                            bottom_width = total_width,
                            bottom_length = 0,
                            height = vault_height + e,
                            top_weight_y = 1
                        );
                    }

                    difference() {
                        translate([-width_extension, 0, vault_height]) {
                            cube([
                                total_width,
                                length + e - length_tolerance_clearance,
                                height - vault_height
                            ]);
                        }
                    }
                }

                translate([
                    cavity ? cavity_width_clearance / -2 : 0,
                    length - e,
                    height - hitch_height
                ]) {
                    _hitch();
                }
            }

            end_gutter = enclosure_wall + window_and_side_panel_gutter;
            y = enclosure_length - enclosure_wall - length;
            for (x = [
                end_gutter,
                enclosure_width - end_gutter - width
            ]) {
                translate([x, y, vault_z]) {
                    _stilt();
                }
            }
        }

        module _volume_wheel_cavity(is_bottom) {
            y = pcb_y + PCB_VOLUME_WHEEL_Y;
            z = get_volume_wheel_z(volume_wheel_cap_height, pcb_z)
                - volume_wheel_vertical_clearance;

            diameter = volume_wheel_diameter + volume_wheel_grip_size * 2
                + tolerance * 4;

            if (is_bottom) {
                translate([pcb_x + PCB_VOLUME_WHEEL_X, y, z]) {
                    cylinder(
                        d = diameter,
                        h = enclosure_bottom_height - z + enclosure_lip_height
                            + e,
                        $fn = HIDEF_ROUNDING
                    );
                }
            }

            exposure_depth = volume_wheel_exposure;
            exposure_depth_height = 2;
            exposure_x = enclosure_width - exposure_depth;

            exposure_width = enclosure_width - exposure_x + e;
            exposure_length = diameter;
            exposure_height = (
                get_volume_wheel_total_height(volume_wheel_cap_height)
                + volume_wheel_vertical_clearance * 2
                + exposure_depth_height * 2
            );

            translate([
                exposure_x + exposure_width,
                y - diameter / 2,
                z - exposure_depth_height
            ]) {
                rotate([0, -90, 0]) {
                    rounded_xy_cube(
                        [exposure_height, exposure_length, exposure_width],
                        radius = quick_preview ? 0 : enclosure_fillet,
                        $fn = DEFAULT_ROUNDING
                    );
                }
            }
        }

        module _bottom() {
            module _mount_stilts_and_spacers() {
                intersection() {
                    translate([pcb_x, pcb_y, pcb_z - e]) {
                        mount_stilts(
                            positions = BACK_PCB_HOLES,
                            height = pcb_stilt_height,
                            z = -pcb_stilt_height,
                            hole_diameter = PCB_MOUNT_HOLE_DIAMETER
                                + tolerance * 2
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
                        wall = enclosure_wall,
                        hole_diameter = PCB_MOUNT_HOLE_DIAMETER + tolerance * 2
                    );
                }
            }

            module _engraving(corner_offset = 10) {
                translate([
                    enclosure_width / 2,
                    enclosure_length * .67,
                    engraving_depth
                ]) {
                    rotate([0, 180, 0]) {
                        engraving(
                            svg = "../../branding.svg",
                            resize = [69, 69 * OSKITONE_LENGTH_WIDTH_RATIO],
                            height = engraving_depth + e,
                            bleed = -tolerance,
                            chamfer = quick_preview ? 0 : engraving_chamfer
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
                    translate([x, ys[i], engraving_depth]) {
                        rotate([0, 180, 0]) {
                            engraving(
                                string = str(i),
                                font = "Work Sans:style=Bold",
                                height = engraving_depth + e,
                                size = font_size,
                                bleed = tolerance * 2,
                                chamfer = quick_preview ? 0 : engraving_chamfer
                            );
                        }
                    }
                }
            }

            module _speaker_container(
                wall = enclosure_inner_wall,
                gusset_count = 3
            ) {
                // Semi-loose fit
                inner_diameter = SPEAKER_MAGNET_DIAMETER + tolerance * 3;
                outer_diameter = inner_diameter + wall * 2;
                height = speaker_z + SPEAKER_MAGNET_HEIGHT
                    - enclosure_floor_ceiling;

                gusset_length =
                    (SPEAKER_CONE_DIAMETER - SPEAKER_MAGNET_DIAMETER) / 2;
                ring_segment_width = (inner_diameter * PI) / gusset_count / 2;

                translate([speaker_x, speaker_y, enclosure_floor_ceiling - e]) {
                    ring(
                        diameter = outer_diameter,
                        height = height,
                        inner_diameter = inner_diameter,
                        $fn = HIDEF_ROUNDING
                    );

                    for (i = [0 : gusset_count - 1]) {
                        rotate([0, 0, 180 + i / gusset_count * 360]) {
                            translate([wall / -2, inner_diameter / 2, 0]) {
                                flat_top_rectangular_pyramid(
                                    top_width = wall,
                                    top_length = wall,

                                    bottom_width = wall,
                                    bottom_length = gusset_length + e,

                                    height = height,
                                    top_weight_y = 0
                                );
                            }
                        }
                    }
                }
            }

            module _pcb_volume_wheel_stilt(length = 2) {
                x = pcb_x + PCB_VOLUME_WHEEL_X - TRIMPOT_KNOB_HEAD_DIAMETER / 2;
                z = enclosure_floor_ceiling - e;

                width = enclosure_width - x - enclosure_wall + e;
                height = pcb_z - z;

                translate([x, pcb_y + PCB_VOLUME_WHEEL_Y - length / 2, z]) {
                    cube([width, length, height]);
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
                            enclosure_fillet,
                            enclosure_height - lip_cavity_height - enclosure_fillet
                        ]) {
                            rotate([0, 90, 0]) {
                                rounded_corner_cutoff(
                                    height = enclosure_width - keys_cavity_xy * 2,
                                    angle = 180,
                                    radius = enclosure_fillet,
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
                            quick_preview ? 0 : enclosure_fillet,
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

            module _pencil_stand(
                cavity = false,
                wall = enclosure_inner_wall
            ) {
                // Eyeballed into place so end of pencil is in the middle
                // and supports enclosure at desired pencil_stand_display_angle.
                // Could probably be derived mathematically!
                depth = 14;
                angle_x = -34;
                angle_y = 14;

                xy = keys_y + (pcb_y - keys_y) / 2;

                translate([xy, xy, cavity ? -e : e]) {
                    if (cavity) {
                        pencil_stand(0, depth - wall, angle_x, angle_y);
                    } else {
                        pencil_stand(
                            wall = wall,
                            depth = depth,
                            angle_x = angle_x,
                            angle_y = angle_y,
                            show_pencil = show_pencil_stand_pencil
                        );
                    }
                }
            }

            difference() {
                union() {
                    _back();
                    _front();
                    switch_container(
                        position = [switch_x, switch_y],
                        exposure_height = switch_exposure_height,
                        wall = enclosure_inner_wall
                    );
                    switch_exposure(
                        position = [switch_x, switch_y],
                        exposure_height = switch_exposure_height,
                        xy_bleed = enclosure_inner_wall,
                        include_switch_cavity = false,
                        z_bleed = -e
                    );
                    if (!reduced_test_case) {
                        _mount_stilts_and_spacers();
                    }
                    _mounting_rail_aligners(cavity = false);
                    _speaker_container();
                    _hitch_stilts();
                    _pcb_volume_wheel_stilt();
                    _keys_hitch_endstop();
                    _pencil_stand();
                }

                if (!reduced_test_case) {
                    switch_exposure(
                        position = [switch_x, switch_y],
                        exposure_height = switch_exposure_height,
                        xy_bleed = tolerance,
                        include_switch_cavity = true,
                        z_bleed = e
                    );
                    _switch_engraving();
                    translate([pcb_x, pcb_y, 0]) {
                        screw_head_exposures(
                            positions = BOTTOM_MOUNTED_PCB_HOLES,
                            tolerance = tolerance,
                            clearance = exposed_screw_head_clearance
                        );
                    }
                    _engraving();
                    _volume_wheel_cavity(is_bottom = true);
                    _pencil_stand(cavity = true);
                }
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
                z = pcb_z + PCB_HEIGHT + mount_height + cantilever_mount_height;

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
                    clearance_height = enclosure_bottom_height
                        + enclosure_lip_height - z;

                    difference() {
                        translate([x, y, z]) {
                            cube([
                                rail_width,
                                mount_length,
                                rail_height
                            ]);
                        }

                        for (_x = [x - e, x + rail_width - clearance]) {
                            translate([_x, y - e, z - e]) {
                                cube([
                                    clearance + e,
                                    mount_length + e * 2,
                                    clearance_height + e
                                ]);
                            }
                        }
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
                            diameter = PCB_MOUNT_HOLE_DIAMETER + tolerance * 2,
                            height = wall_height - WINDOW_PANE_HEIGHT
                                - sill_height - e
                        );

                        for (x = mount_hole_xs) {
                            translate([x, 0, nut_lock_floor + e]) {
                                nut_lock(
                                    include_supportless_screw_cavity = true,
                                    flip_supportless_screw_cavity = true,
                                    hole_diameter = PCB_MOUNT_HOLE_DIAMETER + tolerance * 2
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

            module _led_exposure(
                bleed = 0,
                z_bleed = 0,
                include_gusset = false
            ) {
                $fn = quick_preview ? undef: HIDEF_ROUNDING;

                exposure_z = pcb_z + PCB_HEIGHT - z_bleed;
                exposure_height = enclosure_height - exposure_z + z_bleed;

                center_x = side_panel_x + led_cavity_width / 2;
                center_y = side_panel_y + branding_length / 2;

                gusset_y = key_mounting_rail_y + e;
                gusset_z = pcb_z + PCB_HEIGHT + mount_height
                    + cantilever_mount_height + e;

                gusset_height = enclosure_height - gusset_z - e;
                gusset_length = center_y - gusset_y;
                gusset_width = enclosure_inner_wall;

                hull() {
                    translate([center_x, center_y, exposure_z]) {
                        cylinder(d = LED_DIAMETER + bleed * 2, h = e);
                    }

                    translate([
                        side_panel_x - bleed,
                        side_panel_y - bleed,
                        exposure_z + exposure_height - e
                    ]) {
                        cube([
                            led_cavity_width + bleed * 2,
                            branding_length + bleed * 2,
                            e
                        ]);
                    }
                }

                if (include_gusset) {
                    translate([
                        center_x - gusset_width / 2,
                        gusset_y,
                        gusset_z
                    ]) {
                        cube([
                            gusset_width,
                            gusset_length,
                            gusset_height
                        ]);
                    }
                }
            }

            // TODO: improve bleed/chamfer
            module _branding_cavities(
                line_gutter = enclosure_gutter / 4,
                led_gutter = enclosure_gutter / 2
            ) {
                branding_width = side_panel_width - led_cavity_width
                    - led_gutter;

                branding_x = side_panel_x + side_panel_width - branding_width;

                brand_size = branding_width * OSKITONE_LENGTH_WIDTH_RATIO;
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
                            resize = [branding_width, brand_size],
                            center = false,
                            bleed = -tolerance,
                            chamfer = quick_preview ? 0 : engraving_chamfer
                        );
                    }

                    engraving(
                        string = "POLY555",
                        font = "Orbitron:style=Black",
                        size = model_size,
                        height = engraving_depth + e,
                        center = false,
                        bleed = 0, // intentionally thicker
                        chamfer = quick_preview ? 0 : engraving_chamfer
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

            module _volume_wheel_brace(
                cone_diameter = volume_wheel_diameter * .5
            ) {
                cone_z = get_volume_wheel_z(volume_wheel_cap_height, pcb_z)
                    + get_volume_wheel_total_height(volume_wheel_cap_height)
                    + volume_wheel_brace_clearance;

                module _rib() {
                    width = enclosure_width - enclosure_wall
                        - (pcb_x + PCB_VOLUME_WHEEL_X);
                    length = enclosure_inner_wall;

                    x = enclosure_width - enclosure_wall - width - e;
                    y = pcb_y + PCB_VOLUME_WHEEL_Y - length / 2;
                    z = enclosure_bottom_height + enclosure_lip_height
                        + enclosure_lip_clearance;

                    base_height = enclosure_height - z - enclosure_floor_ceiling
                        + e;

                    hull() {
                        translate([x, y, cone_z]) {
                            cube([cone_diameter / 2, length, e]);
                        }

                        translate([x, y, z]) {
                            cube([width + e, length, base_height]);
                        }
                    }
                }

                module _cone() {
                    translate([
                        pcb_x + PCB_VOLUME_WHEEL_X,
                        pcb_y + PCB_VOLUME_WHEEL_Y,
                        cone_z
                    ]) {
                        cylinder(
                            d1 = cone_diameter,
                            d2 = 0,
                            h = cone_diameter / 2
                        );
                    }
                }

                _rib();
                _cone();
            }

            // TODO: combine with _window_pane_sill
            module _window_pane_top_supports() {
                module _struts(overlap = 1, height = enclosure_wall) {
                    width = BREAKAWAY_SUPPORT_DISTANCE;
                    overlap = overlap + PLASTICS_TOLERANCE;

                    back_x = window_pane_x + window_pane_max_width - width
                        - enclosure_gutter;
                    back_y = enclosure_length - enclosure_wall - overlap;
                    side_x = enclosure_wall;
                    side_y = window_pane_y + (window_pane_length - width) / 2;

                    z = enclosure_height - enclosure_floor_ceiling
                        - WINDOW_PANE_HEIGHT - height;

                    supports_count = round(width / BREAKAWAY_SUPPORT_DISTANCE);
                    support_plot = width / supports_count;

                    module _strut() {
                        cube([width, overlap + e, height]);

                        for (i = [0 : supports_count]) {
                            translate([i * support_plot, 0, height - e]) {
                                breakaway_support(
                                    length = overlap + e,
                                    height = WINDOW_PANE_HEIGHT + e * 2,
                                    flip_vertically = true,
                                    include_first = true,
                                    include_last = false
                                );
                            }
                        }
                    }

                    translate([back_x, back_y, z]) {
                        _strut();
                    }

                    translate([side_x - e + overlap, side_y, z]) {
                        rotate([0, 0, 90]) {
                            _strut();
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
                    _led_exposure(enclosure_minimum_wall, -e, true);
                }
                _keys_and_bumper_cavity();
                _window_cavity();
                _branding_cavities();
                _led_exposure(tolerance, e);
                _speaker_grill();
                _hitch_stilts(cavity = true);
                _volume_wheel_cavity(is_bottom = false);
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

    module _pcb(just_volume_wheel = false) {
        show_pcb = just_volume_wheel ? false : show_pcb;

        translate([pcb_x, pcb_y, pcb_z]) {
            pcb(
                visualize_board =  show_pcb,
                visualize_buttons = show_pcb,
                visualize_circuit_space = quick_preview && show_pcb,
                visualize_silkscreen = !quick_preview && show_pcb,
                visualize_switch = show_switch,
                visualize_volume_wheel = just_volume_wheel,
                visualize_volume_pot = show_pcb,

                simplify_volume_wheel = quick_preview,
                volume_wheel_diameter = volume_wheel_diameter,
                volume_wheel_grip_size = quick_preview
                    ? 0
                    : volume_wheel_grip_size,
                volume_wheel_cap_height = volume_wheel_cap_height,

                pcb_color = pcb_color,
                opacity = pcb_opacity
            );
        }
    }

    module _mounting_rail() {
        color(enclosure_color) {
            difference() {
                translate([
                    key_mounting_rail_x,
                    key_mounting_rail_y,
                    reduced_test_case
                        ? enclosure_floor_ceiling + e * 2
                        : pcb_z + PCB_HEIGHT
                ]) {
                    mounting_rail(
                        width = enclosure_width - key_mounting_rail_x * 2,
                        length = mount_length,
                        height = mount_height,
                        hole_xs = reduced_test_case ? [] : mount_hole_xs,
                        hole_xs_x_offset = keys_x - key_mounting_rail_x,
                        hole_diameter = PCB_MOUNT_HOLE_DIAMETER + tolerance * 2
                    );
                }

                _mounting_rail_aligners(cavity = true);
            }
        }
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

    module _cross_section() {
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
        } else if (cross_section == "volume_pot") {
            cube([
                pcb_x + PCB_VOLUME_WHEEL_X,
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
        } else if (cross_section == "branding") {
            extension = 2;
            x = 11;

            translate([
                side_panel_x + x - extension,
                side_panel_y - extension,
                enclosure_height - enclosure_floor_ceiling
            ]) {
                cube([
                    side_panel_width - x + extension * 2,
                    branding_length + extension * 2,
                    enclosure_floor_ceiling
                ]);
            }
        } else if (cross_section == "hitch_stilt") {
            x = enclosure_wall * 1.5;
            z = enclosure_bottom_height * .67;

            width = BREAKAWAY_SUPPORT_DISTANCE * 2 + x * 2;
            length = 7;

            translate([x, enclosure_length - length, z]) {
                cube([width, length + 10, enclosure_height - z - enclosure_floor_ceiling - e]);
            }
        } else if (reduced_test_case) {
            translate([-e, key_mounting_rail_y - e, -e]) {
                cube([
                    enclosure_width + e * 2,
                    mount_length + e * 2,
                    enclosure_floor_ceiling + BUTTON_HEIGHT
                ]);
            }
        }
    }

    module _output(
        show_enclosure_bottom = false,
        show_battery = false,
        show_speaker = false,
        show_switch = false,
        show_pcb = false,
        show_volume_wheel = false,
        show_mounting_rail = false,
        show_keys = false,
        show_enclosure_top = false,
        show_window_pane = false,
        show_pencil_stand_pencil = false
    ) {
        rotate(
            flip_vertically
                ? [0, 180, 0]
                : use_pencil_stand_display_angle
                    ? [pencil_stand_display_angle, 0, 0]
                    : []
        ) intersection() {
            union() {
                _enclosure(show_enclosure_bottom, show_enclosure_top);
                if (show_battery) { % _battery(); }
                if (show_speaker) { % _speaker(); }
                if (show_pcb) { % _pcb(); }
                if (show_volume_wheel) { _pcb(just_volume_wheel = true); }
                if (show_mounting_rail) { _mounting_rail(); }
                if (show_keys) { _keys(); }
                if (show_window_pane) { % _window_pane();}
            }

            if (cross_section || reduced_test_case) {
                _cross_section();
            }
        }
    }


    if (reduced_test_case) {
        gutter = 1;

        _output(show_enclosure_bottom = true);
        translate([0, mount_length + gutter, -enclosure_floor_ceiling]) {
            _mounting_rail();
        }
    } else {
        _output(
            show_enclosure_bottom = show_enclosure_bottom,
            show_battery = show_battery,
            show_speaker = show_speaker,
            show_switch = show_switch,
            show_pcb = show_pcb,
            show_volume_wheel = show_volume_wheel,
            show_mounting_rail = show_mounting_rail,
            show_keys = show_keys,
            show_enclosure_top = show_enclosure_top,
            show_window_pane = show_window_pane,
            show_pencil_stand_pencil = show_pencil_stand_pencil
        );
    }
}

poly555(
    show_enclosure_bottom = SHOW_ENCLOSURE_BOTTOM,
    show_battery = SHOW_BATTERY,
    show_speaker = SHOW_SPEAKER,
    show_switch = SHOW_SWITCH,
    show_pcb = SHOW_PCB,
    show_volume_wheel = SHOW_VOLUME_WHEEL,
    show_mounting_rail = SHOW_MOUNTING_RAIL,
    show_keys = SHOW_KEYS,
    show_enclosure_top = SHOW_ENCLOSURE_TOP,
    show_window_pane = SHOW_WINDOW_PANE,
    show_pencil_stand_pencil = SHOW_PENCIL_STAND_PENCIL,

    use_pencil_stand_display_angle = USE_PENCIL_STAND_DISPLAY_ANGLE,

    animate_visualized_plastic_tolerance_weight =
        ANIMATE_VISUALIZED_PLASTIC_TOLERANCE_WEIGHT,

    quick_preview = QUICK_PREVIEW && $preview,
    cross_section = CROSS_SECTION,
    echo_dimensions = ECHO_DIMENSIONS,
    flip_vertically = FLIP_VERTICALLY,
    reduced_test_case = REDUCED_TEST_CASE
);
