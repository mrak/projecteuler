pub struct Primes {}

fn is_prime(n: u64) -> bool {
    if n == 2 {
        return true;
    }

    if n % 2 == 0 {
        return false;
    }

    let limit = f64::sqrt(n as f64) as u64 + 1;
    for x in 3..limit {
        if n % x == 0 {
            return false;
        }
    }

    true
}

pub fn nth_prime(n: u64) -> u64 {
    if n == 1 {
        return 2;
    }

    let mut count = 1;
    let mut candidate = 1;

    while count < n {
        candidate += 2;
        if is_prime(candidate) {
            count += 1;
        }
    }

    candidate
}
