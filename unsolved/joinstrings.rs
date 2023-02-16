use std::io::{stdin, BufReader, BufRead};
use std::collections::VecDeque;
fn main() {
    let stdin = BufReader::new(stdin());
    let mut lines = stdin.lines();
    let count: u64 = lines.next().unwrap().unwrap().parse().unwrap();
    let mut strings: VecDeque<VecDeque<String>> = (0..count).map(|_| [lines.next().unwrap().unwrap()].into()).collect();
    for _ in 1..count {
        let op: Vec<usize> = lines
            .next()
            .unwrap()
            .unwrap()
            .split(" ")
            .map(|s| s.parse::<usize>().unwrap() - 1)
            .collect();
        let mut right = std::mem::take(&mut strings[op[1]]);
        strings[op[0]].append(&mut right);
    }
    for string in &strings {
        for slice in string.iter() {
            print!("{slice}");
        }
    }
    println!("");
}

