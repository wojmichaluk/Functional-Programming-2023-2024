onlyEven [] = []
onlyEven (x:xs)
    | x `mod` 2 == 0 = x : onlyEven xs
    | otherwise = onlyEven xs
