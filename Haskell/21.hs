import Data.List (nub)

d :: Int -> Int
d a = (sum . concat) divisorPairs - a
         where divisorPairs = [ [x,y] | x <- [1..((floor . sqrt . fromIntegral) a)]
                                      , let y = a `quot` x
                                      , a `rem` x == 0
                                      ]

main = print $ (sum . nub . concat) [ [a,b] | a <- [1..9999]
                                            , let b = d a
                                            , b < 10000
                                            , a /= b
                                            , a == d b
                                            ]
