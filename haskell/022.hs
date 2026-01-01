{-# LANGUAGE OverloadedStrings #-}
{- HLINT ignore "Functor law" -}
{- HLINT ignore "Redundant <&>" -}
import Data.List (sort)
import Data.Char (ord)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Data.Functor ((<&>))

rateName :: Int -> T.Text -> Int
rateName position = (* position) . sum . T.foldr (\c acc -> (ord c - 64) : acc) []

main = TIO.readFile "022.txt"
  <&> T.strip
  <&> T.splitOn ","
  <&> map (T.dropAround (== '"'))
  <&> sort
  <&> zipWith rateName [1..]
  <&> sum
  >>= print
