---
title: "Problem 18/67"
date: 2013-07-22T22:33:00
---
Solution to Problem 18 and 67. Written in Python.

Problem: By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

![Triangle](http://i.imgur.com/Irs9d.png)

That is, 3 + 7 + 4 + 9 = 23.

![Bigger Triangle](http://i.imgur.com/xmH2t.png)

Find the maximum total from top to bottom of the triangle below:

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

```python
import os

file_path = os.path.join(os.path.dirname(__file__), '..', 'euler_lib/triangle-18.txt')

file = open(file_path, 'r')

triangle = file.readlines()
for i, value in enumerate(triangle):
    triangle[i] = map(int, value.strip().split(' '))

file.close()

sum_triangle = [triangle.pop(0)[0]]
triangle_size = len(triangle) - 1

for row_index, next_row in enumerate(triangle):
    sum_temp = []
    for col_index, value in enumerate(sum_triangle):
        end_index = len(sum_triangle) - 1
        if col_index == 0:
            sum_temp.append(next_row[0] + value)
            sum_temp.append(next_row[1] + value)
        elif col_index == end_index:
            next_row_end_index = len(next_row) - 1
            sum_temp[col_index] = max(sum_temp[col_index], value + next_row[next_row_end_index - 1])
            sum_temp.append(value + next_row[next_row_end_index])
        else:
            sum_temp[col_index] = max(sum_temp[col_index], value + next_row[col_index])
            sum_temp.append(value + next_row[col_index + 1])

    sum_triangle = sum_temp

print max(sum_triangle)
```
