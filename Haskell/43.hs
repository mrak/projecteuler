import Data.List (nub, permutations, intersect)

pandigital :: Integer -> Bool
pandigital x
   | x > 9999999999 || x < 1234567890 = False
   | 10 > (length.nub) (show x) = False
   | otherwise = d2d3d4  `rem` 2  == 0 &&
                 d3d4d5  `rem` 3  == 0 &&
                 d4d5d6  `rem` 5  == 0 &&
                 d5d6d7  `rem` 7  == 0 &&
                 d6d7d8  `rem` 11 == 0 &&
                 d7d8d9  `rem` 13 == 0 &&
                 d8d9d10 `rem` 17 == 0
   where d2d3d4  = x `rem` 1000000000 `quot` 1000000
         d3d4d5  = x `rem` 100000000 `quot` 100000
         d4d5d6  = x `rem` 10000000 `quot` 10000
         d5d6d7  = x `rem` 1000000 `quot` 1000
         d6d7d8  = x `rem` 100000 `quot` 100
         d7d8d9  = x `rem` 10000 `quot` 10
         d8d9d10 = x `rem` 1000

pandigitals = [ read x :: Integer | x <- permutations "1234567890", pandigital (read x :: Integer) ]

main = print $ sum pandigitals
