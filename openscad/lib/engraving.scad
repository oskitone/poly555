module engraving(
    string = "OSKITONE",
    font = "Work Sans:style=Black",
    size = 10,
    bleed = 0,
    height = 1,
    center = true
) {
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

engraving();
