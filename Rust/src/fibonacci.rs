use num_bigint::BigUint;
use num_traits::One;

pub struct Fibonacci {
    prev: BigUint,
    next: BigUint,
}

impl Iterator for Fibonacci {
    type Item = BigUint;
    fn next(&mut self) -> Option<Self::Item> {
        let new_next = &self.prev + &self.next;

        self.prev = self.next.clone();
        self.next = new_next.clone();

        Some(self.prev.clone())
    }
}

pub fn fibonacci() -> Fibonacci {
    Fibonacci {
        prev: BigUint::ZERO,
        next: BigUint::one(),
    }
}
