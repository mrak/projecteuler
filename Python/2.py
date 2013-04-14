#!/usr/bin/env python

one = 0
two = 1
evenTotal = 0

while two <= 4000000:
   one, two = two, one + two

   if two % 2 == 0:
      evenTotal += two

print(evenTotal)
