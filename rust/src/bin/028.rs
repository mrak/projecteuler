fn main() {
    let mut sum = 1;
    let mut w; // w is before x in alphabet, so x - 1
    let mut ne; //compass directions
    let mut nw;
    let mut sw;
    let mut se;

    for x in (3..=1001).step_by(2) {
        w = x - 1;
        ne = x * x;
        nw = ne - w;
        sw = ne - (2 * w);
        se = ne - (3 * w);
        sum += ne + nw + sw + se;
    }
    println!("{sum}");
}
