---
title: "Problem 9"
date: 2013-07-22T21:55:00
---
Solution to Problem 9. Written in Python.

Problem: A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>. For example, 32 + 42 = 9 + 16 = 25 = 52. There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc.

```python
my_range = xrange(1, 1001)
cross_product = [[x, y] for x in my_range for y in my_range]

for [x, y] in cross_product:
    a = pow(x, 2) - pow(y, 2)
    b = 2 * x * y
    c = pow(x, 2) + pow(y, 2)

    if(a + b + c == 1000):
        product = a * b * c
        if product > 0:
            print str(product)
            break

```
