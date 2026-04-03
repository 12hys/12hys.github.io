---
title: "Problem 16"
date: 2013-07-22T22:11:00
---
Solution to Problem 16. Written in Python.

Problem: 2<sup>15</sup> = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26. What is the sum of the digits of the number 2<sup>1000</sup>?

```python
print str(sum(map(int, str(pow(2, 1000)))))

```
