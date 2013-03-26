fibonaccis :: [Int]
fibonaccis = 1:1:zipWith (+) fibonaccis (tail fibonaccis)

total = sum $ filter (\x -> rem x 2 == 0) (takeWhile (< 4000000) fibonaccis)
