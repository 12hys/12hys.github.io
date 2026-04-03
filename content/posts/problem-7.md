---
title: "Problem 7"
date: 2013-07-22T21:46:00
---
Solution to Problem 7. Written in Python.

Problem: By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6<sup>th</sup> prime is 13. What is the 10001<sup>st</sup> prime number?

```python
from problems.euler_lib import euler_lib as lib

print lib.eratosthenes_sieve(1000000)[10000]

# For reference:
def eratosthenes_sieve(n):
    candidates = list(range(n + 1))
    fin = int(n ** 0.5)

    for i in xrange(2, fin + 1):
        if candidates[i]:
            candidates[2 * i::i] = [None] * (n // i - 1)

    return [i for i in candidates[2:] if i]

```
