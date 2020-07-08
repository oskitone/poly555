PCB_WIDTH = 114.3;
PCB_LENGTH = 140.97;
PCB_HEIGHT = 1.6;
PCB_MOUNT_HOLE_DIAMETER = 3;

BUTTON_DIAMETER = 6;
BUTTON_HEIGHT = 6;

PCB_HOLES = [
    [3.81, 137.16],
    [110.49, 137.16],

    [3.81, 27.94],
    [57.15, 27.94],
    [110.49, 27.94],

    [3.81, 3.81],
    [57.15, 3.81],
    [110.49, 3.81],
];

PCB_BUTTONS = [
    [6.096 - 2.286, 10.922],
    [13.716 - 2.286, 16.002],
    [21.336 - 2.286, 10.922],
    [28.956 - 2.286, 16.002],
    [36.576 - 2.286, 10.922],
    [44.196 - 2.286, 16.002],
    [112.776 - 2.286, 10.922],
    [51.816 - 2.286, 10.922],
    [67.056 - 2.286, 10.922],
    [74.676 - 2.286, 16.002],
    [82.296 - 2.286, 10.922],
    [89.916 - 2.286, 16.002],
    [97.536 - 2.286, 10.922],
];

SCREW_HEAD_DIAMETER = 5.5;
NUT_DIAMETER = 6.4;
NUT_HEIGHT = 2.6;

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

BATTERY_WIDTH = 51;
BATTERY_LENGTH = 27.5;
BATTERY_HEIGHT = 16.5;
