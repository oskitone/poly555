include <values.scad>;

// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Add_all_values_in_a_list
function sum(v) = [for(p=v) 1]*v;

function slice(list, start = 0, end) =
    end == 0
        ? []
        : [for (i = [start : (end == undef ? len(list) : end) - 1]) list[i]]
;

function get_starting_note_index(starting_natural_key_index) =
    [0, 2, 4, 5,7, 9, 11][starting_natural_key_index];

function get_natural_key_count(
    total_key_count,
    starting_note_index = 0
) = (
    floor(total_key_count / 12) * 7 +
    (
        total_key_count % 12 == 0
            ? 0
            : sum(
                slice(
                    NATURAL_KEY_SEQUENCES[starting_note_index],
                    0,
                    total_key_count % 12
                )
            )
    )
);

function get_keys_total_width(
    count,
    starting_note_index = 0,
    natural_width,
    gutter
) = (
    let(natural_key_count=get_natural_key_count(count, starting_note_index))
    natural_key_count * natural_width + max(0, natural_key_count - 1) * gutter
);
