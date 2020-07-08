include <values.scad>;

module speaker(
    diameter = SPEAKER_DIAMETER,
    height = SPEAKER_HEIGHT
) {
    cylinder(d = SPEAKER_DIAMETER, h = SPEAKER_HEIGHT);
}

speaker();
