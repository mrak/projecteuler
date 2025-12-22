fn main() {
    let limit = 28123;
    let mut abundant_numbers: Vec<bool> = vec![false; 28124];
    let mut sum_numbers: Vec<bool> = vec![false; 28124];

    for x in 12..limit {
        if is_abundant(x) {
            abundant_numbers[x] = true;
            mark(&abundant_numbers, &mut sum_numbers, x);
        }
    }

    let sum: usize = sum_numbers
        .iter()
        .enumerate()
        .filter(|(_, x)| !**x)
        .map(|(i, _)| i)
        .sum();

    println!("{}", sum);
}

fn mark(abundants: &[bool], sums: &mut [bool], n: usize) {
    let mut x: usize = 12;
    while x <= n && x + n < 28124 {
        if abundants[x] {
            sums[x + n] = true;
        }
        x += 1;
    }
}

fn is_abundant(n: usize) -> bool {
    let mut sum = 0;

    for x in 1..=n / 2 {
        if n % x == 0 {
            sum += x;
            if sum > n {
                return true;
            }
        }
    }

    false
}
