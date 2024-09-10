use num_bigint::BigUint;
use num_traits::One;

pub struct Fibonacci {
    prev: Option<BigUint>,
    next: Option<BigUint>,
}

impl Iterator for Fibonacci {
    type Item = BigUint;
    fn next(&mut self) -> Option<Self::Item> {
        let prev = self.prev.take().unwrap();
        let next = self.next.take().unwrap();
        let new_next = prev.clone() + next.clone();

        self.prev = Some(next);
        self.next = Some(new_next);

        Some(prev)
    }
}

pub fn fibonacci() -> Fibonacci {
    Fibonacci {
        prev: Some(BigUint::ZERO),
        next: Some(BigUint::one()),
    }
}
