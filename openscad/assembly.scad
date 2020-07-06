include <lib/values.scad>;

use <lib/keys.scad>;
use <lib/mounting_rail.scad>;
use <lib/pcb.scad>;

key_gutter = 1;
plot = PCB_BUTTONS[1][0] - PCB_BUTTONS[0][0];

mount_width = plot * 16 - key_gutter;
mount_length = 6;

key_mount_end = PCB_HOLES[2][1] + mount_length / 2;

natural_key_width = plot * 2 - key_gutter;
natural_key_length = natural_key_width * 4;

mount_hole_x_offset = (PCB_WIDTH / 15) - PCB_HOLES[2][0] - key_gutter / 2;
mount_hole_xs = [
    PCB_HOLES[2][0] + mount_hole_x_offset,
    PCB_HOLES[3][0] + mount_hole_x_offset,
    PCB_HOLES[4][0] + mount_hole_x_offset,
];

keys_x = PCB_BUTTONS[0][0] - plot + key_gutter / 2;
keys_z = PCB_HEIGHT + BUTTON_HEIGHT;

color("purple") pcb();

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

_mounting_rail(key_mount_end - mount_length);
_mounting_rail(PCB_HOLES[5][1] - mount_length / 2, 1);

translate([
    keys_x,
    key_mount_end - natural_key_length,
    keys_z
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

        mount_width = mount_width,
        mount_length = mount_length,
        mount_hole_xs = mount_hole_xs
    );
}
