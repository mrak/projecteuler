triangleNumbers :: [Integer]
triangleNumbers = [ sumUpTo x | x <- [1..] ]
   where sumUpTo = sum.flip take [0..]

divisors :: Integral a => a -> [a]
divisors x = foldr accumulateDivisors [] [1..limit]
   where accumulateDivisors = (\n acc -> if x `mod` n == 0 then n:(quot x n):acc else acc)
         limit = (floor.sqrt.fromIntegral) x

main = print $ head [ x | x <- triangleNumbers, (numDivisors x) > 500 ]
   where numDivisors = (length.divisors)
