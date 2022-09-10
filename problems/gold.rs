use std::io::BufRead;

enum Space {
    Floor,
    Gold,
    Start,
    Trap,
    Wall,
}

fn main() {
    let stdin = std::io::stdin();
    let mut lines = stdin.lock().lines();
    let head: Vec<usize> = lines
        .next()
        .unwrap()
        .unwrap()
        .split(" ")
        .map(|line| line.parse().unwrap())
        .collect();
    let width = *head.get(0).unwrap();
    let height = *head.get(1).unwrap();
    let mut field: Vec<Vec<(Space, bool)>> = Vec::new();
    for h in 0..height {
        let line = lines.next().unwrap().unwrap();
        let mut row = Vec::new();
        for chr in line.chars() {
            match chr {
                '.' => row.push((Space::Floor, false)),
                'P' => row.push((Space::Start, true)),
                'G' => row.push((Space::Gold, false)),
                'T' => row.push((Space::Trap, false)),
                '#' => row.push((Space::Wall, false)),
                _ => {},
            }
        }
        field.push(row);
    }
}
