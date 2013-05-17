module Euler where

pythagoreanTriplets :: [[Integer]]
pythagoreanTriplets = [ [a,b,c] | c <- [1..], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2 ]

fibonaccis :: [Integer]
fibonaccis = 1:1:zipWith (+) fibonaccis (tail fibonaccis)

evenFibonaccis :: [Integer]
evenFibonaccis = [ x | x <- fibonaccis, even x ]

triangleNumbers :: [Integer]
triangleNumbers = [ sumUpTo x | x <- [1..] ]
   where sumUpTo = sum . flip take [0..]

primes :: [Integer]
primes = 2 : primes'
  where
    primes' = sieve [3,5..] 9 primes'
    sieve (x:xs) q ps@ ~(p:t)
     | x < q = x : sieve xs q ps
     | True  =     sieve [x | x <- xs, rem x p /= 0] (head t^2) t

largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n =
   last [ x | x <- takeWhile (< (ceiling . sqrt . fromIntegral) n) primes, n `rem` x == 0 ]

isPrime :: Integer -> Bool
isPrime x = elem x [ y | y <- takeWhile (<=x) primes ]

collatz :: Integer -> [Integer]
collatz 1 = [1]
collatz x = let next = if even x
                       then (x `quot` 2)
                       else (3 * x + 1)
            in  x:(collatz next)

factorial :: Integer -> Integer
factorial 0 = 1
factorial 1 = 1
factorial n
   | n < 0     = 0
   | otherwise = n * factorial (n - 1)
