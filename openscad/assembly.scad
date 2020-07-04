include <lib/values.scad>;

use <lib/keys.scad>;
use <lib/pcb.scad>;

key_gutter = 1;
plot = PCB_BUTTONS[1][0] - PCB_BUTTONS[0][0];
mount_length = 6;
key_mount_end = PCB_HOLES[2][1] + mount_length / 2;
natural_key_width = plot * 2 - key_gutter;
natural_key_length = natural_key_width * 3;
mount_hole_x_offset = (PCB_WIDTH / 15) - PCB_HOLES[2][0] - key_gutter / 2;

color("purple") pcb();
translate([
    PCB_BUTTONS[0][0] - plot + key_gutter / 2,
    key_mount_end - natural_key_length,
    PCB_HEIGHT + BUTTON_HEIGHT
]) {
    # mounted_keys(
        count = 13,
        starting_index = 3,

        natural_width = natural_key_width,
        natural_length = natural_key_length,
        natural_height = 4,

        accidental_width = 7.5,
        accidental_length = natural_key_length / 2,
        accidental_height = 6,

        gutter = key_gutter,

        mount_width = plot * 16 - key_gutter,
        mount_length = mount_length,
        mount_hole_xs = [
            PCB_HOLES[2][0] + mount_hole_x_offset,
            PCB_HOLES[3][0] + mount_hole_x_offset,
            PCB_HOLES[4][0] + mount_hole_x_offset,
        ]
    );
}
