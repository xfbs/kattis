use std::io::{stdin, BufReader, BufRead};
fn main() {
    let stdin = BufReader::new(stdin());
    let mut lines = stdin.lines();
    let mut nums: Vec<u64> = lines
        .next()
        .unwrap()
        .unwrap()
        .split(" ")
        .map(|p| p.parse().unwrap())
        .collect();
    nums.sort();
    let order = lines
        .next()
        .unwrap()
        .unwrap();
    let order: Vec<u64> = order
        .chars()
        .map(|c| (c as usize - 'A' as usize))
        .map(|o| nums[o])
        .collect();
    println!("{} {} {}", order[0], order[1], order[2]);
}
