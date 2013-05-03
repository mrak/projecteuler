module Factorial where

factorial 0 = 1
factorial 1 = 1
factorial n
   | n < 0     = 0
   | otherwise = n * factorial (n - 1)
