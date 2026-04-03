---
title: "Problem 21"
date: 2013-07-22T22:38:00
---
Solution to Problem 21. Written in Python.

Problem: Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.

```python
from problems.euler_lib import euler_lib as lib

running_sum = 0
sum_of_divisors = lambda x: sum(lib.get_divisors(x))

for i in xrange(0, 10000):
    sum_i = sum_of_divisors(i)

    if i != sum_i and sum_of_divisors(sum_i) == i:
        running_sum += i

print running_sum

# For reference:
def get_divisors(num):
    return [n for n in range(1, num) if num % n == 0]

```
