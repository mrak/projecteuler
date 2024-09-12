use num_bigint::BigUint;
use num_traits::identities::One;

fn main() {
    // lattice paths to get to position x,y is combinatorics k = x, n = x+y
    // problem is a 20x20 square so k = 20, n = 40
    // n! / ((n-k)! * k!) = 40! / (20! * 20!)
    let n = factorial(40);
    let k = factorial(20);
    println!("{}", n / (k.pow(2)));
}

fn factorial(n: u64) -> BigUint {
    let mut answer = BigUint::one();
    for x in 1..=n {
        answer *= x;
    }
    answer
}
