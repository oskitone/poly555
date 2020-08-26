module engraving(
    string = "OSKITONE",
    font = "Work Sans:style=Black",
    size = 10,
    bleed = 0,
    height = 1,

    stroke = 0,
    stroke_height = 0,

    center = true,

    color = undef,
    stroke_color = undef,

    $fn = undef
) {
    e = 0.0083;

    module _text(height = height, bleed = bleed) {
        linear_extrude(height = height) {
            offset(delta = bleed) {
                text(
                    string,
                    size = size,
                    font = font,
                    halign = center ? "center" : "left",
                    valign = center ? "center" : "baseline"
                );
            }
        }
    }

    module _stroke() {
        difference() {
            _text(height = stroke_height, bleed = stroke + bleed);

            translate([0, 0, -e]) {
                _text(height = stroke_height + e * 2, bleed = 0);
            }
        }
    }

    if (stroke > 0 && stroke_height > 0) {
        color(stroke_color) _stroke();
    }

    color(color) _text();
}

engraving(
    bleed = 1,

    height = 2,
    stroke = 1,
    stroke_height = 3,

    color = "white",
    stroke_color = "black"
);
