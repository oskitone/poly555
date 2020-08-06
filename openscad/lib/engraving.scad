module engraving(
    string = "OSKITONE",
    size = 10,
    bleed = 0,
    height = 1
) {
    linear_extrude(height = height) {
        offset(delta = bleed) {
            text(
                string,
                size = size,
                font = "Work Sans:style=Black",
                halign = "center",
                valign = "center"
            );
        }
    }
}

engraving();
