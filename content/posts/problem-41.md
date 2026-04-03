---
title: "Problem 41"
date: 2015-01-19T12:08:36-05:00
---
Solutions to Problem 41. Written in Python.

Problem: We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?

Method 1: This is my slowest (and original) solution without using any tricks or analysis of the problem. I also used a fast prime number generator from [this StackOverflow answer](http://stackoverflow.com/a/2068548). I first generate all primes up to 987654321 (the largest pandigital integer) and then parallelize the pandigital check and print the maximum of the returned values.

Method 2: Method 2 is much faster with runtimes of around 0.6s on my i7 machine (running on PyPy). We only need to permute on the pandigital numbers. Python's itertools package has a sweet permutations function that does this for us. For a 9 digit number, the permuations are `9! = 362,880`, for 8 digits `8! = 40,320`, and so on.

Method 3: As it turns out, we only need to check the permutations of a 7 digit pandigital number. The [Divisibility Rule](http://en.wikipedia.org/wiki/Divisibility_rule#Divisibility_by_3_or_) states that if the sum of a digits' numbers are divisible by 3 or 9, then the original number is divisible by 3 or 9. This means that all numbers that are 1 to n pandigital are not prime, where n = 9, 8, 6, 5, 3, and 2. The runtime for this solution hovers around 0.15s.

```python
import numpy # Run the command `pypy -m pip install git+https://bitbucket.org/pypy/numpy.git`
from problems.euler_lib import euler_lib as lib
from multiprocessing import Pool
from itertools import permutations

def method_one():
    def primes_from_2_to_n(n):
        """ Input n>=6, Returns a array of primes, 2 <= p < n """
        sieve = numpy.ones(n/3 + (n%6==2), dtype=numpy.bool)
        for i in xrange(1,int(n**0.5)/3+1):
            if sieve[i]:
                k=3*i+1|1
                sieve[       k*k/3     ::2*k] = False
                sieve[k*(k-2*(i&1)+4)/3::2*k] = False
        return numpy.r_[2,3,((3*numpy.nonzero(sieve)[0][1:]+1)|1)]

    primes = primes_from_2_to_n(987654322).tolist()
    primes.reverse()

    p = Pool(8)
    pandigital_primes = p.map(lib.is_pandigital_return_number, primes)

    print max(pandigital_primes)

def method_two():
    max_list = []
    string = '987654321'

    while True:
        for p in permutations(string):
            tmp = int(''.join(p))
            if lib.is_pandigital(tmp) and lib.prime(tmp):
                max_list.append(tmp)

        string = string[1:]

        if len(string) < 2:
            break

    print max(max_list)

def method_three():
    number = '7654321'
    max_list = []

    for p in permutations(number):
        tmp = int(''.join(p))
        if lib.is_pandigital(tmp) and lib.prime(tmp):
            max_list.append(tmp)

    print max(max_list)

method_three()

```
