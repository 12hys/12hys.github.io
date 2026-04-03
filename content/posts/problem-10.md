---
title: "Problem 10"
date: 2013-07-22T21:57:00
---
Solution to Problem 10. Written in Python.

Problem: The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17. Find the sum of all the primes below two million.

```python
from problems.euler_lib import euler_lib as lib

print sum(lib.eratosthenes_sieve(2000000))

# For reference:
def eratosthenes_sieve(n):
    candidates = list(range(n + 1))
    fin = int(n ** 0.5)

    for i in xrange(2, fin + 1):
        if candidates[i]:
            candidates[2 * i::i] = [None] * (n // i - 1)

    return [i for i in candidates[2:] if i]

```
