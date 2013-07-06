import Euler

main = print $ head [ a*b*c | [a,b,c] <- pythagoreanTriplets, a+b+c == 1000 ]
