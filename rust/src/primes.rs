use std::iter;

pub struct Primes {
    current: u64,
}

impl Default for Primes {
    fn default() -> Self {
        Self::new()
    }
}

impl Primes {
    pub fn new() -> Primes {
        Primes { current: 1 }
    }
}

pub struct PrimesIterator {
    primes: Primes,
}

impl IntoIterator for Primes {
    type Item = u64;
    type IntoIter = PrimesIterator;
    fn into_iter(self) -> PrimesIterator {
        PrimesIterator { primes: self }
    }
}

impl Iterator for PrimesIterator {
    type Item = u64;
    fn next(&mut self) -> Option<Self::Item> {
        self.primes.current += 2;

        while !is_prime(self.primes.current) {
            self.primes.current += 2;
        }
        Some(self.primes.current)
    }
}

pub fn prime_iterator() -> impl Iterator<Item = u64> {
    iter::once(2_u64).chain(Primes::new())
}

pub fn is_prime(n: u64) -> bool {
    if n == 2 {
        return true;
    }

    if n % 2 == 0 {
        return false;
    }

    let limit = f64::sqrt(n as f64) as u64 + 1;
    for x in (3..limit).step_by(2) {
        if n % x == 0 {
            return false;
        }
    }

    true
}
