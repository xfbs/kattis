use std::io::{BufReader, BufRead, stdin, Lines};
use std::collections::BTreeSet;

fn read_cds<B: BufRead>(lines: &mut Lines<B>, count: u64) -> BTreeSet<u64> {
    let mut output = BTreeSet::new();
    for _ in 0..count {
        let line = lines.next().unwrap().unwrap().parse().unwrap();
        output.insert(line);
    }
    output
}

fn main() {
    let stdin = BufReader::new(stdin());
    let mut lines = stdin.lines();
    loop {
        let header: Vec<u64> = lines
            .next()
            .unwrap()
            .unwrap()
            .split(" ")
            .map(|num| num.parse().unwrap())
            .collect();
        if header.iter().all(|v| *v == 0) {
            break
        }
        let jack = read_cds(&mut lines, header[0]);
        let jill = read_cds(&mut lines, header[1]);
        let common = jack.intersection(&jill).count();
        println!("{common}");
    }
}
