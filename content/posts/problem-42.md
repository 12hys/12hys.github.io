---
title: "Problem 42"
date: 2015-01-15T10:05:28-05:00
---
Solution to Problem 42. Written in Python.

Problem: The n<sup>th</sup> term of the sequence of triangle numbers is given by, `tn = n(n+1)/2`; so the first ten triangle numbers are:

`1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...`

By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t<sub>10</sub>. If the word value is a triangle number then we shall call the word a triangle word.

Using [words.txt](https://projecteuler.net/project/resources/p042_words.txt) (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

```python
import csv
import os

file_path = os.path.join(os.path.dirname(__file__), '..', 'euler_lib/p042_words.txt')

get_num = lambda word: sum(["-ABCDEFGHIJKLMNOPQRSTUVWXYZ".index(char) for char in word])
tri = lambda n: n * (n + 1) / 2

tri_list = [tri(n) for n in range(1, 100)]

with open(file_path, 'r') as text_file:
    rows = csv.reader(text_file, delimiter=',', quotechar='"')
    words = [word for row in rows for word in row]

print len([word for word in words if get_num(word) in tri_list])

```
