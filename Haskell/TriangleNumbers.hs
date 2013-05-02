module TriangleNumbers where

triangleNumbers :: [Integer]
triangleNumbers = [ sumUpTo x | x <- [1..] ]
   where sumUpTo = sum.flip take [0..]
