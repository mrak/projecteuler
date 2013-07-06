main = print $ maximum possibilities

possibilities = [ x*y | x <- [100..999], y <- [100..999], palendrome (x*y) ]

palendrome x = reverse (show x) == show x
