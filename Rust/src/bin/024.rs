// uses Heap's algorithm in iterative format. Pipe to |sort|sed -n '1000000p' to get answer
#[allow(unused_assignments)]
fn main() {
    //let mut digits: Vec<usize> = vec![0, 1, 2].into_iter().rev().collect();
    let mut digits = vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

    let mut c = vec![0; digits.len()];
    let mut tmp = 0;
    let mut i = 1;

    printdigits(&digits);
    while i < c.len() {
        if c[i] < i {
            if i % 2 == 0 {
                tmp = digits[0];
                digits[0] = digits[i];
                digits[i] = tmp;
            } else {
                tmp = digits[c[i]];
                digits[c[i]] = digits[i];
                digits[i] = tmp;
            }
            printdigits(&digits);

            c[i] += 1;
            i = 1;
        } else {
            c[i] = 0;
            i += 1;
        }
    }
}

fn printdigits(digits: &[usize]) {
    for x in digits {
        print!("{x}");
    }
    println!();
}
