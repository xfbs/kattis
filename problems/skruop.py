import functools
print(functools.reduce(lambda x,y: min(max(x+y, 0), 10), map(lambda x: 1 if x == "Skru op!" else -1, [input() for i in range(int(input()))]), 7))
