pub fn sepa_algorithm(list: &mut [usize]) -> bool {
    let mut len = list.len();
    let mut key = len - 1;
    let mut newkey = len - 1;

    while key > 0 && list[key] <= list[key - 1] {
        key -= 1;
    }

    if key == 0 {
        return true; // done
    }
    key -= 1;

    while newkey > key && list[newkey] <= list[key] {
        newkey -= 1;
    }

    list.swap(key, newkey);

    len -= 1;
    key += 1;

    while len > key {
        list.swap(len, key);
        key += 1;
        len -= 1;
    }

    false // more to go
}
