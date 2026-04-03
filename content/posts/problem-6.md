---
title: "Problem 6"
date: 2013-07-22T21:46:00
---
Solution to Problem 6. Written in Python.

Problem: The sum of the squares of the first ten natural numbers is, 12 + 22 + … + 102 = 385. The square of the sum of the first ten natural numbers is, (1 + 2 + … + 10)2 = 552 = 3025. Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640. Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

```python
my_range = xrange(1, 101)

sum_of_squares = sum(map(lambda x: pow(x, 2), my_range))

print str(pow(sum(my_range), 2) - sum_of_squares)

```
