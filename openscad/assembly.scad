include <lib/values.scad>;

use <lib/keys.scad>;
use <lib/pcb.scad>;

key_gutter = 1;
plot = PCB_BUTTONS[1][0] - PCB_BUTTONS[0][0];
mount_length = 6;
key_mount_end = PCB_HOLES[2][1] + mount_length / 2;
key_length = key_mount_end;

color("purple") pcb();
translate([
    PCB_BUTTONS[0][0] - plot + key_gutter / 2,
    key_mount_end - key_length,
    PCB_HEIGHT + BUTTON_HEIGHT
]) {
    keys(
        count = 13,
        starting_index = 3,

        natural_length = key_length,
        natural_width = plot * 2 - key_gutter,
        natural_height = 4,

        accidental_width = 7.5,
        accidental_length = key_length / 2,
        accidental_height = 6,

        gutter = key_gutter
    );
}
