use num_bigint::BigUint;
use projecteuler::fibonacci;

// First 12 terms: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144
// What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
fn main() {
    let (index, _) = fibonacci::fibonacci()
        .enumerate() // we want to find the index in the end
        .find(|(_, x)| *x > BigUint::from(10_u32).pow(999)) // 10^999 = 1000 digits
        .expect("the fibonacci sequence has a term with 1000 digits");
    println!("{}", index + 1); // rust is 0-indexed but problem asks for 1-indexed answer
}
