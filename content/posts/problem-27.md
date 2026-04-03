---
title: "Problem 27"
date: 2015-01-16T13:00:14-05:00
---
Solution to Problem 27. Written in Python.

Problem: Euler discovered the remarkable quadratic formula: n<sup>2</sup> + n + 41

It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41<sup>2</sup> + 41 + 41 is clearly divisible by 41.

The incredible formula  n<sup>2</sup> − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

n<sup>2</sup> + an + b, where |a| < 1000 and |b| < 1000

where |n| is the modulus/absolute value of n

e.g. |11| = 11 and |−4| = 4


Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.

```python
import itertools
import operator
import collections
from problems.euler_lib import euler_lib as lib

quad = lambda n_range, a, b: [n**2 + a*n + b for n in n_range]

a_b = xrange(-999, 1000)
sieve = lib.eratosthenes_sieve(1000000)
store = collections.defaultdict()

for a in a_b:
    for b in a_b:
        for ctr in itertools.count(2, 1):
            n_range = xrange(0, ctr)
            values = quad(n_range, a, b)

            if all(lib.is_prime(i, sieve) for i in values):
                continue
            else:
                store[a, b] = len(n_range) - 1
                break

values = max(store.iteritems(), key=operator.itemgetter(1))[0]

print values[0] * values[1]

```
