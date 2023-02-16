use std::io::{stdin, BufReader, BufRead};
fn main() {
    let stdin = BufReader::new(stdin());
    let mut lines = stdin.lines();
    let x: i64 = lines.next().unwrap().unwrap().parse().unwrap();
    let y: i64 = lines.next().unwrap().unwrap().parse().unwrap();
    let q = match (x, y) {
        (x, y) if x > 0 && y > 0 => 1,
        (x, y) if x < 0 && y > 0 => 2,
        (x, y) if x < 0 && y < 0 => 3,
        (x, y) if x > 0 && y < 0 => 4,
        _ => unreachable!()
    };
    println!("{q}");
}
