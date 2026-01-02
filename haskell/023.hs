import Data.List (foldl')
import Data.Set (insert,empty, member)
import Euler

limit = 28123

main = print $ sum $ filter (not . isSumOfTwoAbundants) [1..limit]

isSumOfTwoAbundants n = any (\x -> member (n-x) abundantNumbersSet) $ takeWhile (n >) abundantNumbers

abundantNumbers = filter isAbundant [12..limit]
abundantNumbersSet = foldl' (flip insert) empty abundantNumbers

isAbundant :: Integer -> Bool
isAbundant n = n < sumUntil (n <) 0 (divisors n)

sumUntil :: Num a => (a -> Bool) -> a -> [a] -> a
sumUntil f acc [] = acc
sumUntil f acc (x:xs) | f acc     = acc
                      | otherwise = sumUntil f (acc+x) xs
