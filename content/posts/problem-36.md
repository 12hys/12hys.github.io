---
title: "Problem 36"
date: 2014-09-22T21:26:11-04:00
---
Solution to Problem 36. Written in Python.

Problem: The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)

```python
from problems.euler_lib import euler_lib as lib

print sum([num for num in xrange(1000000) if lib.is_palindrome(num) and lib.is_palindrome(bin(num)[2:])])

```
