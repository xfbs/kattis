use std::collections::{BTreeMap, BTreeSet, VecDeque};
use std::io::BufRead;

fn cost(
    books: &BTreeMap<u64, BTreeMap<u64, u64>>,
    postage: &BTreeMap<u64, u64>,
    shops: &BTreeSet<u64>,
    book_shops: &BTreeMap<u64, u64>,
) -> u64 {
    let postage: u64 = shops.iter().map(|shop| postage.get(shop).unwrap()).sum();
    let prices: u64 = book_shops
        .iter()
        .map(|(book, shop)| books.get(book).unwrap().get(shop).unwrap())
        .sum();
    postage + prices
}

fn solve(
    books: &BTreeMap<u64, BTreeMap<u64, u64>>,
    postage: &BTreeMap<u64, u64>,
    shops: &BTreeSet<u64>,
    book_shops: &BTreeMap<u64, u64>,
) -> (BTreeMap<u64, u64>, u64) {
    let mut book_shops = book_shops.clone();
    for (book, prices) in books {
        if !book_shops.contains_key(&book) {
            // if the cheapest vendor is already a shop we use, pick it.
            let mut choices: Vec<(u64, u64)> = prices.iter().map(|(a, b)| (*a, *b)).collect();
            choices.sort_by_key(|(vendor, price)| *price);
            let (cheapest_vendor, _) = choices.first().unwrap();
            if shops.contains(&cheapest_vendor) {
                book_shops.insert(*book, *cheapest_vendor);
                return solve(books, postage, shops, &book_shops);
            }

            // otherwise, brute force.
            let mut shops = shops.clone();
            let mut choices: Vec<(BTreeMap<u64, u64>, u64)> = Vec::new();
            for (shop, _) in prices {
                let shop_used = shops.contains(shop);
                if !shop_used {
                    shops.insert(*shop);
                }

                book_shops.insert(*book, *shop);
                let attempt = solve(books, postage, &shops, &book_shops);
                choices.push(attempt);

                if !shop_used {
                    shops.remove(shop);
                }
            }

            choices.sort_by_key(|(choice, cost)| *cost);
            return choices.swap_remove(0);
        }
    }
    let cost = cost(books, postage, shops, &book_shops);
    return (book_shops, cost);
}

fn main() {
    // read stdin
    let stdin = std::io::stdin();
    let mut input: VecDeque<(u64, u64)> = stdin
        .lock()
        .lines()
        .map(|line| line.unwrap())
        .filter(|l| l.len() != 0)
        .map(|line| {
            println!("{line:?}");
            line.split(" ")
                .map(|i| i.parse().unwrap())
                .collect::<Vec<u64>>()
        })
        .map(|l| (*l.get(0).unwrap(), *l.get(1).unwrap()))
        .collect();

    // parse input
    let (total_books, total_shops) = input.pop_front().unwrap();
    let mut postage = BTreeMap::new();
    let mut books = BTreeMap::new();
    for shop in 0..total_shops {
        let (shop_books, shop_postage) = input.pop_front().unwrap();
        postage.insert(shop, shop_postage);
        for book in 0..shop_books {
            let (book, price) = input.pop_front().unwrap();
            books
                .entry(book)
                .or_insert(BTreeMap::new())
                .insert(shop, price);
        }
    }

    // shops we chose in general, and shops we chose per book.
    let mut shops: BTreeSet<u64> = BTreeSet::new();
    let mut books_shops: BTreeMap<u64, u64> = BTreeMap::new();

    // if there is a single vendor for a book, we must pick it.
    for (book, book_shops) in &books {
        if book_shops.len() == 1 {
            let (shop, _price) = book_shops.iter().next().unwrap();
            shops.insert(*shop);
            books_shops.insert(*book, *shop);
        }
    }

    // if shipping is free, we'll take it!
    for (shop, price) in &postage {
        if *price <= 0 {
            shops.insert(*shop);
        }
    }

    // if the cheapest vendor for a book we already picked, order it from them.
    for (book, book_shops) in &books {
        if !books_shops.contains_key(book) {
            let mut choices: Vec<(u64, u64)> = book_shops.iter().map(|(a, b)| (*a, *b)).collect();
            choices.sort_by_key(|(vendor, price)| *price);
            let (cheapest_vendor, _) = choices.first().unwrap();
            if shops.contains(&cheapest_vendor) {
                books_shops.insert(*book, *cheapest_vendor);
            }
        }
    }

    let (solved, cost) = solve(&books, &postage, &shops, &books_shops);
    println!("Cost {cost}");
    println!("Solved {solved:?}");
}
