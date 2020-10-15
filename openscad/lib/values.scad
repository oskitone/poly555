DEFAULT_ROUNDING = 24;
HIDEF_ROUNDING = 120;

SACRIFICIAL_BRIDGE_HEIGHT = .2;
BREAKAWAY_SUPPORT_DEPTH = .5;
BREAKAWAY_SUPPORT_GUTTER = 1;
BREAKAWAY_SUPPORT_DISTANCE = 10;

PCB_WIDTH = 183.954;
PCB_LENGTH = 114.808;
PCB_HEIGHT = 1.6;
PCB_MOUNT_HOLE_DIAMETER = 3.2;

PCB_BATTERY_CAVITY_X = 135.382;
PCB_BATTERY_CAVITY_Y = 48.768;
PCB_BATTERY_CAVITY_LENGTH = PCB_LENGTH - PCB_BATTERY_CAVITY_Y + 1;

PCB_COMPONENTS_X = 2.54;
PCB_COMPONENTS_Y = 28.448;
PCB_COMPONENTS_WIDTH = PCB_BATTERY_CAVITY_X - PCB_COMPONENTS_X - 2.54 * 2;
PCB_COMPONENTS_LENGTH = PCB_LENGTH - PCB_COMPONENTS_Y - 2.54;
PCB_COMPONENTS_HEIGHT = 12;

PCB_SWITCH_X = 168.402;
PCB_SWITCH_Y = 8.636;

PCB_LED_X = 160.02 - 2.54 / 2;
PCB_LED_Y = 31.242;

PCB_VOLUME_WHEEL_X = 182.118 - 2.54;
PCB_VOLUME_WHEEL_Y = 34.29 + 2.54;

BUTTON_DIAMETER = 6;
BUTTON_LENGTH = 6.6;
BUTTON_WIDTH = 4.5;
BUTTON_HEIGHT = 6;

POT_HEIGHT = 7.8;

BOTTOM_MOUNTED_PCB_HOLES = [
    [175.804, 22.606],
    [8.164, 22.606],
    [64.044, 22.606],
    [119.924, 22.606],
];

BACK_PCB_HOLES = [
    [26.416, 92.964],
    [108.712, 92.964],
];

WIRE_RELIEF_HOLES = [
    [172.466, 44.704],
    [164.338, 44.704],
];

PCB_HOLES = concat(
    BOTTOM_MOUNTED_PCB_HOLES,
    BACK_PCB_HOLES,
    WIRE_RELIEF_HOLES
);

PCB_BUTTONS = [
    [10.414, 8.89 - BUTTON_LENGTH],
    [18.034, 13.97 - BUTTON_LENGTH],
    [25.654, 8.89 - BUTTON_LENGTH],
    [33.274, 13.97 - BUTTON_LENGTH],
    [40.894, 8.89 - BUTTON_LENGTH],
    [48.514, 13.97 - BUTTON_LENGTH],
    [56.134, 8.89 - BUTTON_LENGTH],
    [71.374, 8.89 - BUTTON_LENGTH],
    [78.994, 13.97 - BUTTON_LENGTH],
    [86.614, 8.89 - BUTTON_LENGTH],
    [94.234, 13.97 - BUTTON_LENGTH],
    [101.854, 8.89 - BUTTON_LENGTH],
    [117.094, 8.89 - BUTTON_LENGTH],
    [124.714, 13.97 - BUTTON_LENGTH],
    [132.334, 8.89 - BUTTON_LENGTH],
    [139.954, 13.97 - BUTTON_LENGTH],
    [147.574, 8.89 - BUTTON_LENGTH],
    [155.194, 13.97 - BUTTON_LENGTH],
    [162.814, 8.89 - BUTTON_LENGTH],
    [178.054, 8.89 - BUTTON_LENGTH],
];

SCREW_HEAD_DIAMETER = 6;
SCREW_HEAD_HEIGHT = 2.1;
NUT_DIAMETER = 6.4;
NUT_HEIGHT = 2.4;

DEFAULT_NUT_LOCK_HEIGHT_CLEARANCE = .1;
DEFAULT_NUT_LOCK_DIAMETER_CLEARANCE = .1;

MOUNT_STILT_MINIMUM_HEIGHT = NUT_HEIGHT + .5 + 2; // TODO: tidy against mount_stilt args

NATURAL_KEY_SEQUENCES = [
    [1,0,1,0,1,1,0,1,0,1,0,1,],
    [0,1,0,1,1,0,1,0,1,0,1,1,],
    [1,0,1,1,0,1,0,1,0,1,1,0,],
    [0,1,1,0,1,0,1,0,1,1,0,1,],
    [1,1,0,1,0,1,0,1,1,0,1,0,],
    [1,0,1,0,1,0,1,1,0,1,0,1,],
    [0,1,0,1,0,1,1,0,1,0,1,1,],
    [1,0,1,0,1,1,0,1,0,1,1,0,],
    [0,1,0,1,1,0,1,0,1,1,0,1,],
    [1,0,1,1,0,1,0,1,1,0,1,0,],
    [0,1,1,0,1,0,1,1,0,1,0,1,],
    [1,1,0,1,0,1,1,0,1,0,1,0,],
];

HINGE_CLASP_DEFAULT_PIN_DIAMETER = 1.75; // filament diameter
HINGE_CLASP_DEFAULT_MINIMAL_SUPPORT = 1.5;
HINGE_CLASP_MINIMUM_TOOTH_WIDTH = 5;
HINGE_CLASP_MINIMUM_TOOTH_COUNT = 5;
HINGE_CLASP_MINIMUM_WIDTH = HINGE_CLASP_MINIMUM_TOOTH_WIDTH
    * HINGE_CLASP_MINIMUM_TOOTH_COUNT;
MINIMUM_HINGE_CLASP_LENGTH = 20;

HINGE_CLASP_SIDE_FRONT_BACK = 0;
HINGE_CLASP_SIDE_LEFT_RIGHT = 1;

LIP_BOX_DEFAULT_LIP_HEIGHT = 3;

BATTERY_WIDTH = 48.6;
BATTERY_LENGTH = 25.8;
BATTERY_HEIGHT = 17.1;
BATTERY_SNAP_WIDTH = 4.2;

/* S20X35VFS */
SPEAKER_DIAMETER = 41.1;
SPEAKER_HEIGHT = 23.5;
SPEAKER_LENGTH = 71;
SPEAKER_CLEARANCE = 2;
SPEAKER_PLATE_HOLE_DIAMETER = 3.6;
SPEAKER_PLATE_HOLE_XY = 4;
SPEAKER_PLATE_HEIGHT = .8;
SPEAKER_RIM_DEPTH = 3.8;
SPEAKER_RIM_HEIGHT = 1.4 - .4; // explicitly undersizing for good fit
SPEAKER_CONE_DIAMETER = 38;
SPEAKER_MAGNET_DIAMETER = 22;
SPEAKER_MAGNET_HEIGHT = 7.5;

/* https://www.ckswitches.com/media/1428/os.pdf */
SWITCH_BASE_WIDTH = 4.4;
SWITCH_BASE_LENGTH = 8.7;
SWITCH_BASE_HEIGHT = 4.5;
SWITCH_ACTUATOR_WIDTH = 2;
SWITCH_ACTUATOR_LENGTH = 2.1;
SWITCH_ACTUATOR_HEIGHT = 3.8;
SWITCH_ACTUATOR_TRAVEL = 1.5;
SWITCH_ORIGIN = [SWITCH_BASE_WIDTH / 2, 6.36];

LED_DIAMETER = 5.9;
LED_HEIGHT = 8.6;

PENCIL_STAND_CAVITY_DIAMETER = 8.5;

PLASTICS_TOLERANCE = 1.524; // https://www.tapplastics.com/product/plastics/cut_to_size_plastic
WINDOW_PANE_HEIGHT = 25.4 * 1 / 8;

HITCH_DEFAULT_MOUNT_SCREW_HEAD_CLEARANCE = .1;
HITCH_DEFAULT_SCREW_FLOOR = .4;
HITCH_RECOMMENDED_MINIMUM_CAVITY_HEIGHT = SCREW_HEAD_HEIGHT
    + HITCH_DEFAULT_MOUNT_SCREW_HEAD_CLEARANCE
    + HITCH_DEFAULT_SCREW_FLOOR
    + (SCREW_HEAD_DIAMETER - PCB_MOUNT_HOLE_DIAMETER) / 2;

TRIMPOT_KNOB_HEAD_DIAMETER = 6.15;
TRIMPOT_KNOB_HEAD_HEIGHT = 1.5;

HITCH_HEAD_LENGTH = 8;
HITCH_HEAD_HEIGHT = 2;
HITCH_WALL_LENGTH = 6;
HITCH_HEIGHT = 10;
HITCH_DOVETAIL_HEIGHT = 3;
HITCH_DOVETAIL_WALL = .8;
