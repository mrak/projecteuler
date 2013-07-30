import System.IO
import Data.List (foldl1)

main = do filename <- promptFile
          contents <- readFile filename
          print $ maxTreeSum contents

promptFile = do putStr "Filename: "
                hFlush stdout
                getLine

maxTreeSum :: String -> Int
maxTreeSum s = maximum $ foldl1 maxDescendants $ treeify s

treeify :: String -> [[Int]]
treeify = map intify . lines

intify :: String -> [Int]
intify line = map read $ words line

maxDescendants :: [Int] -> [Int] -> [Int]
maxDescendants ps ds = reverse . snd $ foldl pickParent (0:ps,[]) ds

pickParent (p1:p2:ps,ms) d = (p2:ps, (max p1 p2) + d : ms)
pickParent (p:[],ms) d = (p:[], p + d : ms)
