#!/usr/bin/env python

import math

def isPalindrome(number):
   asString = str(number)
   half = math.floor(len(asString) / 2)
   return asString[:half] == asString[-half:][::-1]

maximum = 0

for i in range(100,999):
   for j in range(100,999):
      number = i*j
      if number < maximum:
         continue
      if isPalindrome(number):
         maximum = number

print(maximum)
