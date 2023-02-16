use std::io::{stdin, BufReader, BufRead, Lines};
use std::collections::BTreeMap;
fn read_nums<B: BufRead>(lines: &mut Lines<B>) -> Vec<u64> {
    lines
        .next()
        .unwrap()
        .unwrap()
        .split(" ")
        .map(|p| p.parse().unwrap())
        .collect()
}
fn read_num<B: BufRead>(lines: &mut Lines<B>) -> u64 {
    lines.next().unwrap().unwrap().parse().unwrap()
}
fn main() {
    let stdin = BufReader::new(stdin());
    let mut lines = stdin.lines();
    loop {
        let nums = read_nums(&mut lines);
        if nums.iter().all(|n| *n == 0) {
            break;
        }
        let n = nums[0]; // number of nodes
        let m = nums[1]; // number of edges
        let q = nums[2]; // queries
        let s = nums[3]; // starting node
        let mut edges = BTreeMap::new();
        for _ in 0..m {
            let nums = read_nums(&mut lines);
            edges.insert((nums[0], nums[1]), nums[2]);
        }
        let mut distance = BTreeMap::new();
        distance.insert(s, 0);
        let mut change = false;
        loop {
            let nodes: Vec<u64> = distance.keys().copied().collect();
            for node in &nodes {
            }
            if !change {
                break;
            }
        }
    }
}
