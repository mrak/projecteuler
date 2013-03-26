result = sum $ filter (\x -> x `rem` 3 == 0 || x `rem` 5 == 0) [3..999]
