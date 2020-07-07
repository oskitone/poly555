use <lib/utils.scad>;

module assert_equal(a,b) {
    assert(a == b, str("Expected ", a, " to equal ", b));
}

assert_equal(get_natural_key_count(1, 0), 1);
assert_equal(get_natural_key_count(2, 0), 1);
assert_equal(get_natural_key_count(3, 0), 2);
assert_equal(get_natural_key_count(4, 0), 2);
assert_equal(get_natural_key_count(5, 0), 3);
assert_equal(get_natural_key_count(6, 0), 4);
assert_equal(get_natural_key_count(7, 0), 4);
assert_equal(get_natural_key_count(8, 0), 5);
assert_equal(get_natural_key_count(9, 0), 5);
assert_equal(get_natural_key_count(10, 0), 6);
assert_equal(get_natural_key_count(11, 0), 6);
assert_equal(get_natural_key_count(12, 0), 7);
assert_equal(get_natural_key_count(13, 0), 8);
assert_equal(get_natural_key_count(25, 0), 15);

assert_equal(get_natural_key_count(4, 11), 3);
assert_equal(get_natural_key_count(5, 11), 3);
assert_equal(get_natural_key_count(8, 11), 5);
assert_equal(get_natural_key_count(15, 11), 9);

module test_get_keys_total_width(
    total_key_count,
    starting_note_index,
    expected_result
) {
    assert_equal(
        get_keys_total_width(
            count = total_key_count,
            starting_note_index = starting_note_index,
            natural_width = 1,
            gutter = .1
        ), expected_result
    );
}

test_get_keys_total_width(0, 0, 0);
test_get_keys_total_width(1, 0, 1);
test_get_keys_total_width(2, 0, 1);
test_get_keys_total_width(3, 0, 2.1);
test_get_keys_total_width(4, 0, 2.1);
test_get_keys_total_width(5, 0, 3.2);
test_get_keys_total_width(6, 0, 4.3);
test_get_keys_total_width(7, 0, 4.3);
test_get_keys_total_width(8, 0, 5.4);
test_get_keys_total_width(9, 0, 5.4);
test_get_keys_total_width(10, 0, 6.5);
test_get_keys_total_width(11, 0, 6.5);
test_get_keys_total_width(12, 0, 7.6);
test_get_keys_total_width(13, 0, 8.7);
test_get_keys_total_width(14, 0, 8.7);

assert_equal(get_starting_note_index(0), 0); // c
assert_equal(get_starting_note_index(1), 2); // d
assert_equal(get_starting_note_index(2), 4); // e
assert_equal(get_starting_note_index(3), 5); // f
assert_equal(get_starting_note_index(4), 7); // g
assert_equal(get_starting_note_index(5), 9); // a
assert_equal(get_starting_note_index(6), 11); // b
