import Euler

main = print $ sum [ x | x <- takeWhile (< 4000000) evenFibonaccis ]
