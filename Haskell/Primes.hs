module Primes where

primes = 2 : primes'
  where
    primes' = sieve [3,5..] 9 primes'
    sieve (x:xs) q ps@ ~(p:t)
     | x < q = x : sieve xs q ps
     | True  =     sieve [x | x <- xs, rem x p /= 0] (head t^2) t

largestPrimeFactor n =
   last [ x | x <- takeWhile (< (ceiling . sqrt . fromIntegral) n) primes, n `rem` x == 0 ]

isPrime x = elem x [ y | y <- takeWhile (<=x) primes ]
