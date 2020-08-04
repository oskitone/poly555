include <lib/values.scad>;

use <lib/basic_shapes.scad>;
use <lib/battery.scad>;
use <lib/enclosure.scad>;
use <lib/keys.scad>;
use <lib/mount_stilt.scad>;
use <lib/mounting_rail.scad>;
use <lib/pcb.scad>;
use <lib/speaker.scad>;
use <lib/switch.scad>;
use <lib/utils.scad>;

module assembly(
    key_gutter = 1,
    natural_key_exposed_height = 2,
    accidental_key_extra_height = 2,

    enclosure_wall = 1.8,
    enclosure_inner_wall = 1.2,
    enclosure_to_component_gutter = 2,
    enclosure_to_component_z_clearance = 2,
    enclosure_chamfer = 2,
    enclosure_rounding = 24,

    bottom_component_clearance = 1,
    speaker_to_pcb_clearance = 4,

    mount_length = 6,
    cantilever_length = 2,
    cantilever_height = 2,

    tolerance = .1,

    keys_count = 20,
    starting_natural_key_index = 3,
    key_travel = 1.4,

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

    natural_key_width = plot * 2 - key_gutter;
    natural_key_length = natural_key_width * 4
        - cantilever_length - mount_length;

    mount_width= get_keys_total_width(
        count = keys_count,
        starting_note_index =
            get_starting_note_index(starting_natural_key_index),
        natural_width = natural_key_width,
        gutter = key_gutter
    );
    mount_height = BUTTON_HEIGHT;

    mount_end_on_pcb = PCB_HOLES[4][1] +  mount_length / 2;

    keys_y_over_pcb = natural_key_length + cantilever_length + mount_length
        - mount_end_on_pcb;
    keys_from_pcb_x_offset = PCB_BUTTONS[0][0] - BUTTON_WIDTH / 2 - plot + key_gutter / 2;
    keys_cavity_length = natural_key_length + key_gutter * 2; // TODO: tighten

    mount_hole_xs = [
        PCB_HOLES[4][0] - keys_from_pcb_x_offset,
        PCB_HOLES[5][0] - keys_from_pcb_x_offset,
        PCB_HOLES[6][0] - keys_from_pcb_x_offset,
        PCB_HOLES[7][0] - keys_from_pcb_x_offset,
    ];

    pcb_window_extension = PCB_COMPONENTS_Y - mount_end_on_pcb;
    pcb_x = enclosure_gutter - keys_from_pcb_x_offset;
    pcb_y = (natural_key_length + cantilever_length + mount_length)
        - mount_end_on_pcb + enclosure_gutter;
    pcb_z = enclosure_wall + max(
        MOUNT_STILT_MINIMUM_HEIGHT,
        SPEAKER_HEIGHT + speaker_to_pcb_clearance,
        SWITCH_BASE_HEIGHT + SWITCH_ACTUATOR_HEIGHT
            - enclosure_wall + bottom_component_clearance
    );
    pcb_stilt_height = pcb_z - enclosure_wall;

    enclosure_width = enclosure_gutter * 2 + mount_width;
    enclosure_length = keys_cavity_length
        + mount_length
        + enclosure_gutter * 2
        + PCB_COMPONENTS_LENGTH + pcb_window_extension * 2;

    enclosure_height = enclosure_wall * 2
        + pcb_stilt_height
        + PCB_HEIGHT + PCB_COMPONENTS_HEIGHT
        + WINDOW_PANE_HEIGHT
        + enclosure_to_component_z_clearance;

    key_height = enclosure_height - pcb_stilt_height - enclosure_wall
        - PCB_HEIGHT - mount_height + natural_key_exposed_height;
    keys_x = pcb_x + keys_from_pcb_x_offset;
    keys_y = pcb_y - natural_key_length - cantilever_length + mount_end_on_pcb
        - mount_length;
    keys_z = pcb_z + PCB_HEIGHT + BUTTON_HEIGHT;

    speaker_x = enclosure_width / 2;
    speaker_y = enclosure_wall + SPEAKER_DIAMETER / 2
        + enclosure_to_component_gutter;

    switch_x = pcb_x + PCB_SWITCH_X;
    switch_y = pcb_y + PCB_SWITCH_Y;
    switch_z = pcb_z;
    switch_exposure_height = switch_z - SWITCH_BASE_HEIGHT;

    battery_x = enclosure_width - BATTERY_WIDTH - enclosure_wall - tolerance;
    battery_y = pcb_y + PCB_BATTERY_CAVITY_Y
        + (PCB_BATTERY_CAVITY_LENGTH - BATTERY_LENGTH) / 2;

    window_pane_x = enclosure_wall + tolerance;
    window_pane_y = pcb_y + mount_end_on_pcb;
    window_pane_z = enclosure_height - enclosure_wall - WINDOW_PANE_HEIGHT;
    window_pane_width = enclosure_width - enclosure_wall * 2 - tolerance * 2;
    window_pane_length = enclosure_length - window_pane_y - enclosure_wall
        - tolerance * 2;

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
                accidental_length = natural_key_length / 2,
                accidental_height = key_height + accidental_key_extra_height,

                front_chamfer = quick_preview ? 0 : 2,

                gutter = key_gutter,

                mount_length = mount_length,
                mount_height = cantilever_height,
                mount_hole_xs = mount_hole_xs,

                cantilever_length = cantilever_length,
                cantilever_height = cantilever_height,

                include_mount = include_natural,
                include_natural = include_natural,
                include_accidental = include_accidental,
                include_hitch = include_hitch,

                key_travel = key_travel,

                hitch_height = mount_height + key_height / 3,
                hitch_y = pcb_y - keys_y + PCB_HOLES[0][1],
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

    module _enclosure() {
        module _enclosure_half(is_top) {
            color(enclosure_color, enclosure_opacity) enclosure_half(
                width = enclosure_width,
                length = enclosure_length,
                total_height = enclosure_height,

                wall = enclosure_wall,
                floor_ceiling = undef,

                add_lip = !is_top,
                remove_lip = is_top,

                include_hinge = true,
                include_hinge_parts = show_hinge_parts,

                hinge_count = 2,
                include_clasp = true,
                just_hinge_parts = show_just_hinge_parts,
                radius = quick_preview ? 0 : enclosure_chamfer,
                tolerance = tolerance,

                $fn = enclosure_rounding
            );
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
                length = BATTERY_LENGTH * .5,
                wall = enclosure_inner_wall,
                ramp = 5
            ) {
                translate([
                    battery_x - wall - ramp,
                    battery_y + (BATTERY_LENGTH - length) / 2,
                    enclosure_wall
                ]) {
                    flat_top_rectangular_pyramid(
                        top_width = wall,
                        top_length = length,
                        bottom_width = wall + ramp,
                        bottom_length = length,
                        height = BATTERY_HEIGHT * .67,
                        top_weight_x = 1
                    );
                }
            }

            module _speaker_container(
                wall = enclosure_inner_wall,
                gap_width = 10,
                gap_count = 3,
                $fn = HIDEF_ROUNDING,
                e = 0.3
            ) {
                translate([speaker_x, speaker_y, enclosure_wall - e]) {
                    difference() {
                        cylinder(
                            d = SPEAKER_DIAMETER + tolerance * 2 + wall * 2,
                            h = SPEAKER_HEIGHT + e
                        );

                        translate([0, 0, -e]) {
                            cylinder(
                                d = SPEAKER_DIAMETER + tolerance * 2,
                                h = SPEAKER_HEIGHT + e * 3
                            );
                        }

                        for (i = [0 : gap_count - 1]) {
                            rotate([0, 0, i * (360 / gap_count)]) {
                                translate([gap_width / -2, 0, 0]) {
                                    cube([
                                        gap_width,
                                        SPEAKER_DIAMETER / 2 + wall + e,
                                        SPEAKER_HEIGHT + e * 3
                                    ]);
                                }
                            }
                        }
                    }
                }
            }

            module _switch_exposure(
                xy_bleed = 0,
                include_switch_cavity = true,
                z_bleed = 0
            ) {
                width_extension = switch_exposure_height / 2;
                length_extension = switch_exposure_height / 2;

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

            module _mount_stilts() {
                intersection() {
                    translate([pcb_x, pcb_y, pcb_z - e]) {
                        mount_stilts(
                            positions = PCB_HOLES,
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
            }

            module _screw_head_cavities() {
                for (p = PCB_HOLES) {
                    translate([pcb_x + p.x, pcb_y + p.y, -e]) {
                        cylinder(
                            d = SCREW_HEAD_DIAMETER + tolerance * 2,
                            h = SCREW_HEAD_HEIGHT + bottom_component_clearance + e,
                            $fn = HIDEF_ROUNDING
                        );
                    }
                }
            }

            module _screw_head_cavity_bridges() {
                for (p = PCB_HOLES) {
                    translate([
                        pcb_x + p.x,
                        pcb_y + p.y,
                        SCREW_HEAD_HEIGHT + bottom_component_clearance
                    ]) {
                        cylinder(
                            d = SCREW_HEAD_DIAMETER + enclosure_wall * 2,
                            h = SACRIFICIAL_BRIDGE_HEIGHT
                        );
                    }
                }
            }

            difference() {
                union() {
                    _enclosure_half(false);
                    _switch_container();
                    _switch_exposure(
                        xy_bleed = enclosure_inner_wall,
                        include_switch_cavity = false,
                        z_bleed = -e
                    );
                    _battery_container();
                    _speaker_container();
                    _mount_stilts();
                }

                _switch_exposure(
                    xy_bleed = tolerance / 2,
                    include_switch_cavity = true,
                    z_bleed = e
                );
                _screw_head_cavities();
            }

            _screw_head_cavity_bridges();
        }

        module _top() {
            module _keys_cavity() {
                translate([
                    enclosure_gutter - key_gutter,
                    enclosure_gutter - key_gutter,
                    enclosure_height - enclosure_wall - e
                ]) {
                    cube([
                        mount_width + key_gutter * 2,
                        keys_cavity_length,
                        enclosure_wall + e * 2
                    ]);
                }
            }

            module _pcb_window_pane_cavity(
                /* Make window align with keys: */
                window_pane_x_exposure = pcb_x + PCB_COMPONENTS_X
                    - enclosure_gutter + key_gutter,
                window_pane_y_exposure = pcb_window_extension
            ) {
                translate([
                    pcb_x + PCB_COMPONENTS_X - window_pane_x_exposure,
                    pcb_y + PCB_COMPONENTS_Y - window_pane_y_exposure,
                    enclosure_height - enclosure_wall - e
                ]) {
                    cube([
                        PCB_COMPONENTS_WIDTH + window_pane_x_exposure * 2,
                        PCB_COMPONENTS_LENGTH + window_pane_y_exposure * 2,
                        enclosure_wall + e * 2
                    ]);
                }
            }

            difference() {
                translate([enclosure_width, 0, enclosure_height]) {
                    rotate([180, 0, 180]) {
                        _enclosure_half(true);
                    }
                }
                _keys_cavity();
                _pcb_window_pane_cavity();
                _pcb(true);
                /* TODO: window pane support */
            }
        }

        if (show_enclosure_top) { _top(); }
        if (show_enclosure_bottom) { _bottom(); }
        if (show_just_hinge_parts) {
            assert(
                !show_enclosure_top && !show_enclosure_bottom,
                "Don't show_enclosure_top or show_enclosure_bottom when using show_just_hinge_parts"
            );
            _enclosure_half();
        }
    }

    module _battery() {
        translate([battery_x, battery_y, enclosure_wall + e]) {
            translate([0, BATTERY_LENGTH + e, 0]) {
                cube([BATTERY_WIDTH, BATTERY_SNAP_LENGTH, BATTERY_HEIGHT]);
            }

            battery();
        }
    }

    module _speaker() {
        assert(pcb_stilt_height > SPEAKER_HEIGHT, "Speaker doesn't fit");

        translate([speaker_x, speaker_y, enclosure_wall - e]) {
            speaker();
        }
    }

    module _pcb(
        for_enclosure_cavity = false,
        volume_wheel_diameter = 21,
        volume_wheel_grip_size = .6
    ) {
        translate([pcb_x, pcb_y, pcb_z]) {
            pcb(
                visualize_board =  !for_enclosure_cavity,
                visualize_buttons = !for_enclosure_cavity,
                visualize_circuit_space = quick_preview && !for_enclosure_cavity,
                visualize_silkscreen = !quick_preview && !for_enclosure_cavity,
                visualize_switch = show_switch && !for_enclosure_cavity,
                visualize_volume_wheel = for_enclosure_cavity || !quick_preview,

                // TODO: simplify cavity to plain cylinder
                volume_wheel_diameter = for_enclosure_cavity
                    ? volume_wheel_diameter
                        + volume_wheel_grip_size * 2
                        + tolerance * 4
                    : volume_wheel_diameter,
                volume_wheel_grip_size =
                    (quick_preview || for_enclosure_cavity)
                        ? 0
                        : volume_wheel_grip_size,

                pcb_color = pcb_color,
                opacity = pcb_opacity
            );
        }
    }

    module _mounting_rails() {
        module _mounting_rail(y, z, height, include_head_cavity = false) {
            translate([
                keys_x,
                pcb_y + y,
                pcb_z + PCB_HEIGHT + z
            ]) {
                mounting_rail(
                    width = mount_width,
                    length = mount_length,
                    height = height,
                    hole_xs = mount_hole_xs,
                    include_head_cavity = include_head_cavity,
                    head_hole_diameter = SCREW_HEAD_DIAMETER + tolerance * 2
                );
            }
        }

        _mounting_rail(
            mount_end_on_pcb - mount_length,
            0,
            mount_height
        );
        _mounted_keys(include_hitch = true);
        _mounting_rail(
            mount_end_on_pcb - mount_length,
            mount_height + cantilever_height,
            enclosure_height - keys_z - cantilever_height - enclosure_wall - 1,
            true
        );
    }

    module _window_pane() {
        translate([window_pane_x, window_pane_y, window_pane_z + e]) {
            color(window_pane_color, window_pane_opacity) {
                cube([window_pane_width, window_pane_length, WINDOW_PANE_HEIGHT - e * 2]);
            }
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
            if (show_window_pane) { _window_pane(); }
        }

        /* translate([-20, -20, -20]) cube([35, 300, 100]); // switch */
        /* translate([speaker_x, speaker_y, -e]) cylinder(d = SPEAKER_DIAMETER + 8, h = 40); */
        /* translate([-e, -10, -e]) cube([enclosure_width / 2, enclosure_length + 20, enclosure_height + 20]); // cross section */
        /* translate([-e, -10, -e]) cube([ pcb_x + PCB_SWITCH_X + SWITCH_BASE_WIDTH / 2 - SWITCH_ORIGIN.x, enclosure_length + 20, enclosure_height + 20 ]); */
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
    show_window_pane = false,
    show_just_hinge_parts = false,
    quick_preview = DEV_MODE
);
