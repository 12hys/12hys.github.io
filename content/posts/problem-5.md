---
title: "Problem 5"
date: 2013-07-22T21:45:00
---
Solution to Problem 5. Written in Python.

Problem: 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder. What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

```python
my_range = xrange(1, 21)
my_range_len = len(my_range)
is_divisible_by_all = lambda number: len([ctr for ctr in my_range if number % ctr == 0]) == my_range_len

answer = 1
while not is_divisible_by_all(answer):
    answer += 1

print(str(answer))

```
