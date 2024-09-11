use projecteuler::primes;
use std::collections::HashSet;

// unsolved
fn main() {
    let limit = 100;
    let mut sum = 0;
    let primes = (2..=limit)
        .filter(|x| primes::is_prime(*x))
        .collect::<HashSet<u64>>();
    let even_not_primes: u64 = (2..=limit)
        .filter(|x| *x % 2 == 0 && !primes::is_prime(*x))
        .count()
        .try_into()
        .unwrap();
    println!("{even_not_primes}");

    for a in 2..=limit {
        if primes.contains(&a) {
            sum += limit - 1;
            if (a as f64) < (limit as f64).sqrt() {
                sum -= even_not_primes;
            }
            continue;
        }
        sum += limit - 1;
    }

    println!("{sum}");
}
