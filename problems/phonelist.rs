use std::io::{stdin, BufReader, BufRead};
use std::collections::BTreeSet;
fn main() {
    let stdin = BufReader::new(stdin());
    let mut lines = stdin.lines();
    let test_cases: u64 = lines.next().unwrap().unwrap().parse().unwrap();
    for _ in 0..test_cases {
        let mut phone_numbers = BTreeSet::new();
        let count: u64 = lines.next().unwrap().unwrap().parse().unwrap();
        for _ in 0..count {
            let phone_number = lines.next().unwrap().unwrap();
            phone_numbers.insert(phone_number);
        }
        let consistent = phone_numbers.iter()
            .all(|num| (0..num.len()).all(|len| !phone_numbers.contains(&num[0..len])));
        if consistent {
            println!("YES");
        } else {
            println!("NO");
        }
    }
}
