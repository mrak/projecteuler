ones = [ ""
       , "one"
       , "two"
       , "three"
       , "four"
       , "five"
       , "six"
       , "seven"
       , "eight"
       , "nine"
       , "ten"
       , "eleven"
       , "twelve"
       , "thirteen"
       , "fourteen"
       , "fifteen"
       , "sixteen"
       , "seventeen"
       , "eighteen"
       , "nineteen"
       ]
tens = [ "", ""
       , "twenty"
       , "thirty"
       , "forty"
       , "fifty"
       , "sixty"
       , "seventy"
       , "eighty"
       , "ninety" ]

under100 x
   | x `rem` 100 == 0 = 0
   | x < 100   = rest x
   | otherwise = length "and" + rest x
      where rest x = let piece = x `rem` 100
                     in  if piece < 20
                         then length $ ones!!piece
                         else length $ tens!!(piece `quot` 10) ++ ones!!(piece `rem` 10)
hundred x
   | x < 100 = 0
   | x `rem` 1000 `quot` 100 == 0 = 0
   | otherwise = length $ ones!!(x `rem` 1000 `quot` 100) ++ "hundred"

thousand x
   | x == 1000 = length $ "one" ++ "thousand"
   | otherwise = 0

countLetters n = (under100 n) + (hundred n) + (thousand n)

main = print $ foldr (\n acc -> acc + countLetters n) 0 [1..1000]
