use projecteuler::permutations;
use std::collections::HashSet;

fn main() {
    let mut digits = vec![1, 2, 3, 4, 5, 6, 7, 8, 9];
    // Use HashSet to remove duplicate products
    let mut products: HashSet<usize> = HashSet::new();
    loop {
        // Attempt all A x B = C combinations of this digit ordering
        permute_identity_functions(&mut products, &digits);
        // mutate digits into their next lexographic permutation
        if permutations::sepa_algorithm(&mut digits) {
            break;
        }
    }
    // The question wants the sum of all unique products
    println!("{}", products.into_iter().sum::<usize>());
}

// Chop up proposed digits into three sections ABC where A x B = C
fn permute_identity_functions(products: &mut HashSet<usize>, digits: &[usize]) {
    // [...x...y...]
    // | A | B | C | ~> A x B = C
    for x in 1..digits.len() - 2 {
        for y in x + 1..digits.len() - 1 {
            test_identity_function(products, x, y, digits);
        }
    }
}

// Convert slices A,B,C into integers and test A x B = C
// If true, add product to the set of products
fn test_identity_function(products: &mut HashSet<usize>, x: usize, y: usize, digits: &[usize]) {
    let multiplicand = digits_to_int(&digits[..x]);
    let multiplier = digits_to_int(&digits[x..y]);
    let product = digits_to_int(&digits[y..]);

    if multiplicand * multiplier == product {
        //println!("{multiplicand} x {multiplier} = {product}");
        products.insert(product);
    }
}

fn digits_to_int(digits: &[usize]) -> usize {
    digits
        .iter()
        .rev()
        .enumerate()
        .fold(0_usize, |a, (i, e)| a + (10_usize.pow(i as u32) * *e))
}
