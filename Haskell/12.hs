triangleNumbers = [ sumUpTo x | x <- [1..] ]
   where sumUpTo = sum . flip take [0..]

divisors x = [ n | n <- [1..((floor . sqrt . fromIntegral) x)], x `mod` n == 0 ]

main = print $ head [ x | x <- triangleNumbers, (numDivisors x) > 500 ]
   where numDivisors x = length $ divisors x
