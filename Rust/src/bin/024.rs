use projecteuler::permutations;

fn main() {
    let mut digits = vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    let mut count = 0;
    loop {
        count += 1;
        if count == 1000000 {
            break;
        }
        if permutations::sepa_algorithm(&mut digits) {
            break;
        }
    }
    for x in digits {
        print!("{x}");
    }
    println!();
}
