use <lib/utils.scad>;

assert(get_natural_key_count(1, 0) == 1);
assert(get_natural_key_count(2, 0) == 1);
assert(get_natural_key_count(3, 0) == 2);
assert(get_natural_key_count(4, 0) == 2);
assert(get_natural_key_count(5, 0) == 3);
assert(get_natural_key_count(6, 0) == 4);
assert(get_natural_key_count(7, 0) == 4);
assert(get_natural_key_count(8, 0) == 5);
assert(get_natural_key_count(9, 0) == 5);
assert(get_natural_key_count(10, 0) == 6);
assert(get_natural_key_count(11, 0) == 6);
assert(get_natural_key_count(12, 0) == 7);
assert(get_natural_key_count(13, 0) == 8);
assert(get_natural_key_count(25, 0) == 15);

assert(get_natural_key_count(4, 11) == 3);
assert(get_natural_key_count(5, 11) == 3);
assert(get_natural_key_count(8, 11) == 5);
assert(get_natural_key_count(15, 11) == 9);
