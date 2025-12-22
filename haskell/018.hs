import System.IO
import Data.List (foldr1)

main :: IO ()
main = getFilename
       >>= readFile
       >>= print . solve . treeify

getFilename :: IO String
getFilename = putStr "Filename: "
              >> hFlush stdout
              >> getLine

solve :: [[Int]] -> Int
solve = head . foldr1 compress

treeify :: String -> [[Int]]
treeify = map (map read . words) . lines

compress :: [Int] -> [Int] -> [Int]
compress [] compressed = compressed
compress (p:ps) (c1:c2:cs) = p + max c1 c2 : compress ps (c2:cs)
