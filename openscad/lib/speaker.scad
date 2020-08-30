include <values.scad>;

module speaker() {
    e = .095;

    module _hulls(
        d1 = SPEAKER_CONE_DIAMETER,
        d2 = SPEAKER_DIAMETER,
        h = e,
        z = SPEAKER_HEIGHT - SPEAKER_RIM_HEIGHT - SPEAKER_PLATE_HEIGHT - e
    ) {
        hull() {
            for (y = [
                SPEAKER_LENGTH / 2 - SPEAKER_DIAMETER / 2,
                SPEAKER_LENGTH / -2 + SPEAKER_DIAMETER / 2,
            ]) {
                translate([0, y, z]) {
                    cylinder(d1 = d1, d2 = d2, h = h);
                }
            }
        }
    }

    module _rim() {
        z = SPEAKER_HEIGHT - SPEAKER_RIM_HEIGHT;

        translate([0, 0, -e]) difference() {
            _hulls(
                d1 = SPEAKER_DIAMETER,
                d2 = SPEAKER_DIAMETER,
                h = SPEAKER_RIM_HEIGHT,
                z = z
            );

            _hulls(
                d1 = SPEAKER_DIAMETER - SPEAKER_RIM_DEPTH,
                d2 = SPEAKER_DIAMETER - SPEAKER_RIM_DEPTH,
                h = SPEAKER_RIM_HEIGHT + e * 2,
                z = z - e
            );
        }
    }

    module _plate() {
        translate([
            SPEAKER_DIAMETER / -2,
            SPEAKER_LENGTH / -2,
            SPEAKER_HEIGHT - SPEAKER_RIM_HEIGHT - SPEAKER_PLATE_HEIGHT
        ]) {
            difference() {
                cube([SPEAKER_DIAMETER, SPEAKER_LENGTH, SPEAKER_PLATE_HEIGHT]);

                for (xy = [
                    [SPEAKER_PLATE_HOLE_XY, SPEAKER_PLATE_HOLE_XY],
                    [SPEAKER_DIAMETER - SPEAKER_PLATE_HOLE_XY, SPEAKER_PLATE_HOLE_XY],
                    [SPEAKER_PLATE_HOLE_XY, SPEAKER_LENGTH - SPEAKER_PLATE_HOLE_XY],
                    [SPEAKER_DIAMETER - SPEAKER_PLATE_HOLE_XY, SPEAKER_LENGTH - SPEAKER_PLATE_HOLE_XY],
                ]) {
                    translate([xy.x, xy.y, -e]) {
                        cylinder(
                            d = SPEAKER_PLATE_HOLE_DIAMETER,
                            h = SPEAKER_PLATE_HEIGHT + e * 2
                        );
                    }
                }
            }
        }
    }

    module _cone() {
        hull() {
            _hulls();

            translate([0, 0, SPEAKER_MAGNET_HEIGHT]) {
                cylinder(d = SPEAKER_CONE_DIAMETER, h = e);
            }
        }
    }

    module _magnet() {
        cylinder(
            d = SPEAKER_MAGNET_DIAMETER,
            h = SPEAKER_MAGNET_HEIGHT
        );
    }

    _rim();
    % _plate();
    _cone();
    _magnet();
}

translate([SPEAKER_DIAMETER / -2, SPEAKER_LENGTH / -2, 0]) {
    # cube([SPEAKER_DIAMETER, SPEAKER_LENGTH, SPEAKER_HEIGHT]);
}

speaker();
