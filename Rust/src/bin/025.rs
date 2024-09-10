use num_bigint::BigUint;
use projecteuler::fibonacci;

fn main() {
    let (index, answer) = fibonacci::fibonacci()
        .enumerate()
        .find(|(_, x)| *x > BigUint::from(10_u32).pow(999))
        .unwrap();
    println!("index: {}", index + 1);
    println!("number: {}", answer);
}
