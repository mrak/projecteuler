#!/usr/bin/env python

sumOfSquares = 0
squareOfSum = 0

for x in range(1,101):
   sumOfSquares += x*x
   squareOfSum += x

squareOfSum *= squareOfSum
print(squareOfSum - sumOfSquares)
