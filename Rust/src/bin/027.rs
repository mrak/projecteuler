use projecteuler::primes;

fn main() {
    let mut max = 0;
    let mut answer_product = 0;
    for b in primes::prime_iterator().take_while(|p| *p <= 1000) {
        let b = b as i32;
        for a in -999..1000 {
            let mut count = 0;
            for n in 0.. {
                if !primes::is_prime(((n * n) + (a * n) + b).abs().try_into().unwrap()) {
                    break;
                }
                count += 1;
            }
            if count > max {
                max = count;
                answer_product = a * b;
            }
            count = 0;
            for n in 0.. {
                if !primes::is_prime(((n * n) + (a * n) - b).abs().try_into().unwrap()) {
                    break;
                }
                count += 1;
            }
            if count > max {
                max = count;
                answer_product = a * b;
            }
        }
    }

    println!("{answer_product}");
}
