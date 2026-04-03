---
title: "Problem 4"
date: 2013-07-22T21:43:00
---
Solution to Problem 4. Written in Python.

Problem: A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99. Find the largest palindrome made from the product of two 3-digit numbers.

```python
from problems.euler_lib import euler_lib as lib

print max([i * j for i in range(100, 1000) for j in range(100, 1000) if lib.is_palindrome(i * j)])

```
