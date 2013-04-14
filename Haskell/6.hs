main = print $ sqsum - sumsqs
       where
         numbers = [1..100]
         sqsum = (sum numbers)^2
         sumsqs = sum (map (^2) numbers)
