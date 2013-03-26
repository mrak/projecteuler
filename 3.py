#!/usr/bin/env python

from math import sqrt
from math import floor

number = 600851475143
limit = floor(sqrt(number))
primes = [True] * limit
primes[0] = False

for i in range(2,limit):
   if primes[i] == False:
      continue

   for j in range(i*2,limit,i):
      primes[j] = False

highest = max(x for x in range(limit) if primes[x] and number % x == 0)

print(highest)
