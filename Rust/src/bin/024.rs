fn main() {
    let mut digits = vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    let mut count = 0;
    loop {
        count += 1;
        if count == 1000000 {
            break;
        }
        if sepa_algorithm(&mut digits) {
            break;
        }
    }
    for x in digits {
        print!("{x}");
    }
    println!();
}

fn sepa_algorithm(list: &mut [usize]) -> bool {
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
