module Collatz where

collatz :: Integer -> [Integer]
collatz 1 = [1]
collatz x = let next = if even x
                       then (x `quot` 2)
                       else (3 * x + 1)
            in  x:(collatz next)


