module engraving(
    string = undef,
    svg = undef,
    resize = undef,
    font = "Work Sans:style=Black",
    size = 10,
    bleed = 0,
    height = 1,
    center = true,
    chamfer = 0
) {
    e = .03;
    minimal_layer_height = .1;

    module _layer(height, bleed) {
        linear_extrude(height = height) offset(delta = bleed) resize(resize) {
            if (string != undef) {
                text(
                    string,
                    size = size,
                    font = font,
                    halign = center ? "center" : "left",
                    valign = center ? "center" : "baseline"
                );
            } else if (svg != undef) {
                import(
                    file = svg,
                    center = center
                );
            }
        }
    }

    _layer(height - chamfer, bleed);

    if (chamfer > 0) {
        count = ceil(chamfer / minimal_layer_height);
        _layer_height = chamfer / count;

        for (i = [0 : count - 1]) {
            /* z = height - chamfer + i * minimal_layer_height - e; */
            z = height - chamfer + i * _layer_height - e;

            translate([0, 0, z]) {
                _layer(
                    height = _layer_height + e,
                    bleed = bleed + (i + 1) * _layer_height
                );
            }
        }
    }
}

size = 4.2088;
width = 33;
height = 2.4;
length = size + 3;
e = .01;
depth = height - 1;

chamfers = [0, .1, .2, .4];
bleeds = [-.1, 0];

/* Best for this text looks to be -.1 bleed and .1-.2 chamfer */

for (i = [0 : len(chamfers) - 1]) {
    for (ii = [0 : len(bleeds) - 1]) {
        translate([ii * (width - e), i * (length - e), 0]) {
            difference() {
                cube([width, length, height]);

                translate([width / 2, length / 2, height - depth]) {
                    engraving(
                        string = "XYZ0123",
                        size = size,
                        font="Orbitron:style=Black",
                        height = depth + e,
                        bleed = bleeds[ii],
                        chamfer = chamfers[i]
                    );
                }
            }
        }
    }
}

for (i = [0 : len(chamfers) - 1]) {
    for (ii = [0 : len(bleeds) - 1]) {
        translate([ii * (width - e), 40 + i * (length - e), 0]) {
            difference() {
                cube([width, length, height]);

                translate([width / 2, length / 2, height - depth]) {
                    engraving(
                        svg = "../../branding.svg",
                        height = depth + e,
                        bleed = bleeds[ii],
                        chamfer = chamfers[i]
                    );
                }
            }
        }
    }
}
