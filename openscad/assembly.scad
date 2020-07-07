include <lib/values.scad>;

use <lib/keys.scad>;
use <lib/mounting_rail.scad>;
use <lib/pcb.scad>;
use <lib/utils.scad>;

module assembly(
    key_gutter = 1,

    pcb_color = "purple",
    natural_key_color = "white",
    accidental_key_color = "black",
    key_opacity = 0.75
) {
    plot = PCB_BUTTONS[1][0] - PCB_BUTTONS[0][0];

    natural_key_width = plot * 2 - key_gutter;
    natural_key_length = natural_key_width * 4;

    mount_width= get_keys_total_width(
        count = 13,
        starting_note_index = 5,
        natural_width = natural_key_width,
        gutter = key_gutter
    );
    mount_length = 6;

    key_mount_end = PCB_HOLES[2][1] + mount_length / 2;

    mount_hole_x_offset = (PCB_WIDTH / 15) - PCB_HOLES[2][0] - key_gutter / 2;
    mount_hole_xs = [
        PCB_HOLES[2][0] + mount_hole_x_offset,
        PCB_HOLES[3][0] + mount_hole_x_offset,
        PCB_HOLES[4][0] + mount_hole_x_offset,
    ];

    keys_x = PCB_BUTTONS[0][0] - plot + key_gutter / 2;
    keys_z = PCB_HEIGHT + BUTTON_HEIGHT;

    color(pcb_color) pcb();

    module _mounting_rail(y, height_difference = 0) {
        translate([keys_x, y, PCB_HEIGHT]) {
            # mounting_rail(
                width = mount_width,
                length = mount_length,
                height = keys_z - PCB_HEIGHT - height_difference,
                hole_xs = mount_hole_xs,
                hole_diameter = 2
            );
        }
    }

    module _mounted_keys(
        include_natural = false,
        include_accidental = false
    ) {
        translate([
            keys_x,
            key_mount_end - natural_key_length,
            keys_z
        ]) {
            mounted_keys(
                count = 13,
                starting_natural_key_index = 3,

                natural_width = natural_key_width,
                natural_length = natural_key_length,
                natural_height = 4,

                accidental_width = 7.5,
                accidental_length = natural_key_length / 2,
                accidental_height = 6,

                gutter = key_gutter,

                mount_length = mount_length,
                mount_hole_xs = mount_hole_xs,

                include_natural = include_natural,
                include_accidental = include_accidental
            );
        }
    }

    _mounting_rail(key_mount_end - mount_length);
    _mounting_rail(PCB_HOLES[5][1] - mount_length / 2, 1);

    color(natural_key_color, key_opacity)
        _mounted_keys(include_natural = true);
    color(accidental_key_color, key_opacity)
        _mounted_keys(include_accidental = true);
}

assembly();
