use std::collections::HashMap;

fn main() {
    println!(
        "{}",
        (2..1000)
            .map(long_division_recurring_cycle)
            .max_by_key(|x| x.1)
            .unwrap()
            .0
    );
}

fn long_division_recurring_cycle(divisor: usize) -> (usize, usize) {
    let mut seen_dividends: HashMap<usize, usize> = HashMap::new();
    let mut current_dividend: usize = 1;
    let mut terms: Vec<usize> = Vec::new();

    loop {
        if let Some(x) = seen_dividends.get(&current_dividend) {
            return (divisor, terms.len() - x); // 0 is always the first term
        }
        let (q, r) = (current_dividend / divisor, current_dividend % divisor);
        if r == 0 {
            return (divisor, 0);
        }
        terms.push(q);
        seen_dividends.insert(current_dividend, terms.len() - 1);
        current_dividend = r * 10;
    }
}
