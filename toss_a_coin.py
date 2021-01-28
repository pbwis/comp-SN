import random
print("Heads or tails. Let's toss a coin five times.\n")
toss = 1
counts = {"HEADS": 0, "TAILS": 0}

while toss <= 5:
    coin = ["HEADS", "TAILS"]
    y = random.choice(coin)
    counts[y] += 1
    print("Toss number:", toss, "is showing:", y)
    toss = toss + 1

print("Heads was " + str(counts["HEADS"]) + " times - Tails was " + str(counts["TAILS"]) + " times")
