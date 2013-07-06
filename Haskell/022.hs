import System.IO
import Data.List (groupBy, sortBy, foldl')
import Data.Function (on)
import Data.Char (ord)
import Euler (strcompare)

listNames :: String -> [String]
listNames string = groupBy ((==) `on` (== ',')) [ x | x <- string, x /= '"', x /= '\r', x /= '\n' ]

sortNames :: String -> [String]
sortNames names = sortBy strcompare $ (filter (/= ",") . listNames) names

rateName :: String -> Int -> Int
rateName name position = position * foldr letterAdd 0 name
    where letterAdd c acc = (ord c - 64) + acc

main = do
    contents <- readFile "22.txt"
    let sorted = sortNames contents
    print $ snd $ foldl' fun (0,0) sorted
        where fun (i,s) name = let index = i + 1
                               in  (index, s + rateName name index)
