module Fibonacci where

fibonaccis :: [Int]
fibonaccis = 1:1:zipWith (+) fibonaccis (tail fibonaccis)

evenFibonaccis = [ x | x <- fibonaccis, even x ]
