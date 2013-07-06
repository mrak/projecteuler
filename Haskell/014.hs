import qualified Data.IntMap as IM

main = print $ fst result

result = foldr maxify (1,1) (IM.toList chains) where
   maxify (a,b) (c,d)
      | b > d     = (a,b)
      | otherwise = (c,d)

   chains = foldl lengthify (IM.singleton 1 1) [2,3..1000000]

   lengthify im x = collatzLengths x (im,x,1)

   collatzLengths x (im,n,l) =
      case IM.lookup n im of
         Just b  -> IM.insert x (l + b) im
         Nothing -> let next = if even n
                               then n `quot` 2
                               else 3 * n + 1
                  in  collatzLengths x (im,next,l + 1)
