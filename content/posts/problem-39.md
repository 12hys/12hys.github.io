---
title: "Problem 39"
date: 2015-01-17T13:28:10-05:00
---
Solution to Problem 39. Written in Python.

Problem: If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

`{20,48,52}, {24,45,51}, {30,40,50}`

For which value of p ≤ 1000, is the number of solutions maximised?

```python
import math
import itertools
from problems.euler_lib import euler_lib as lib

c = lambda a, b: math.sqrt(a ** 2 + b ** 2)
test = lambda a, b, p: (a + b + c(a, b)) == p


def count_permutations(p):
    permutes = []
    a_b_range = range(1, p + 1)

    for a in a_b_range:
        for b in a_b_range:
            c_val = c(a, b)
            test = a + b + c_val

            if test == p:
                permutes.append(sorted([a, b, int(c_val)]))

    permutes.sort()
    return len(list(k for k, _ in itertools.groupby(permutes)))

max_permutes = 0
perimeter = 0

for p in range(1, 1001):
    value = count_permutations(p)

    if value > max_permutes:
        perimeter = p
        max_permutes = value

print perimeter

```
