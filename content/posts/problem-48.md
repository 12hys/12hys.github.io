---
title: "Problem 48"
date: 2013-07-22T22:12:00
---
Solution to Problem 48. Written in Python.

Problem: The series, 1<sup>1</sup> + 2<sup>2</sup> + 3<sup>3</sup> + … + 10<sup>10</sup> = 10405071317. Find the last ten digits of the series, 1<sup>1</sup> + 2<sup>2</sup> + 3<sup>3</sup> + … + 1000<sup>1000</sup>.

```python
print str(sum([pow(x, x) for x in xrange(1, 1001)]))[-10:]

```
