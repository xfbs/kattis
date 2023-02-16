use std::io::{stdin, BufReader, BufRead};
fn main() {
    let stdin = BufReader::new(stdin());
    let mut lines = stdin.lines();
    let models: u64 = lines.next().unwrap().unwrap().parse().unwrap();
    let days = (0..models)
        .take_while(|i| 2_u64.pow((*i as u32).saturating_sub(1)) <= models)
        .map(|printer_days| {
            let printers = 2_u64.pow(printer_days as u32);
            let model_days = (models + printers - 1) / printers;
            printer_days + model_days
        })
        .min()
        .unwrap();
    println!("{days}");
}
