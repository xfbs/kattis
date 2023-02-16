use std::io::{stdin, BufReader, BufRead};
fn main() {
    let stdin = BufReader::new(stdin());
    let mut lines = stdin.lines();
    let input: u64 = lines.next().unwrap().unwrap().parse().unwrap();
    let mut side = 2;
    for _ in 0..input {
        side = 2 * (side - 1) + 1;
    }
    let total = side * side;
    println!("{total}");
}
