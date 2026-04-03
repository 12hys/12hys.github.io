---
title: "Problem 24"
date: 2014-08-25T09:30:37-04:00
---
Solution to Problem 24. Written in Python.

Problem: A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

```python
def method_one():
    def get_value(array):
        return int(''.join(str(x) for x in array))

    digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    count = 1
    digits.sort()
    digits_count = len(digits)
    pivot = digits[0]
    pivot_index = 0
    max_value = get_value(sorted(digits, reverse=True))
    current_permutation = 0

    while current_permutation < max_value and count != 1000000:
        for i in range(digits_count - 1):
            if digits[i] < digits[i + 1]:
                pivot = digits[i]
                pivot_index = i

        ceil = min(filter(lambda x: x > pivot, digits[pivot_index + 1:]))
        ceil_index = digits.index(ceil)

        # swap two array elements
        digits[ceil_index], digits[pivot_index] = digits[pivot_index], digits[ceil_index]

        # sort the sub list after the original pivot index
        digits[pivot_index + 1:] = sorted(digits[pivot_index + 1:])
        current_permutation = get_value(digits)
        count = count + 1

    print current_permutation

def method_two():
    import itertools
    permutes = itertools.permutations([0,1,2,3,4,5,6,7,8,9])

    count = 1
    for p in permutes:
        if count == 1000000:
            print ''.join([str(x) for x in list(p)])
        count += 1

method_two();

```
