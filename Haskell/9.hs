import Pythagorean

main = print $ head [ a*b*c | [a,b,c] <- triplets, a+b+c == 1000 ]
