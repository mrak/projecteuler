import Data.Char (digitToInt)
import Euler (factorial)

main = print $ foldr (\x acc -> acc + digitToInt x) 0 $ show (factorial 100)
