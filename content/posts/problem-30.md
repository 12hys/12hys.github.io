---
title: "Problem 30"
date: 2014-02-23T13:17:05-05:00
---
Solution to Problem 30. Written in Python.

Problem: Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1<sup>4</sup> + 6<sup>4</sup> + 3<sup>4</sup> + 4<sup>4</sup>  
8208 = 8<sup>4</sup> + 2<sup>4</sup> + 0<sup>4</sup> + 8<sup>4</sup>  
9474 = 9<sup>4</sup> + 4<sup>4</sup> + 7<sup>4</sup> + 4<sup>4</sup>  

As 1 = 1<sup>4</sup> is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

```python
from problems.euler_lib import euler_lib as lib

fifth_power = lambda x: x ** 5

answer = []
for i in range(2, (9 ** 5) * 6 + 1):
    sum_of_digits = sum(map(fifth_power, lib.get_digits(i)))

    if(i == sum_of_digits):
        answer.append(i)

print str(sum(answer))

```
