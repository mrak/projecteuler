import Euler
-- projecteuler assumes 1-index, but we use      0-indexed
main = mapM_ (putStr . show) $ nthLexicographic (1000000-1) [0,1,2,3,4,5,6,7,8,9]

-- this uses a factorial radix to immediately arrive at the kth permutation
-- each iteration:
-- 1. get (quotient,remainder) of k/(N-1)! where N is the length of the list and k is the index
-- 2. take out item y from index@quotient from the list
-- 3. append y to result, and use `remainder` as new k value
-- 4. we are done when the list is empty
nthLexicographic 0 xs = xs
nthLexicographic n xs = go n (length xs - 1) xs
  where go k f [] = []
        go k f xs = let (q,r) = divMod k (factorial . fromIntegral $ f)
                        (Just y, ys) = breakOut (fromIntegral q) xs
                    in y : go r (f-1) ys
