---
layout: post
title: "Getting Functional"
date: 2015-02-23 22:21:16 -0500
comments: true
categories: 
---

This is my first Haskell program, I plan to solve more Project Euler problems using Haskell as I get better at it.

Problem 1 - Project Euler

```haskell
main = print $ sum [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]
```