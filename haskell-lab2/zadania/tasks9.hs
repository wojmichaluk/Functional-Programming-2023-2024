--task 1
qSort :: Ord a => [a] -> [a]
qSort [] = []
qSort (x:xs) = qSort (leftPart xs) ++ [x] ++ qSort (rightPart xs)
    where leftPart xs = filter (<=x) xs
          rightPart xs = filter (>x) xs

--task 2, task 3, task 4 - nie zrobiłem

--task 5
isSorted :: [Int] -> Bool
isSorted xs = xs == qSort xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse xs ++ [x]

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = [(x,y)] ++ zip' xs ys

{- coś chyba nie działa :-C
unzip' :: [(a,b)] -> ([a],[b])
unzip' [] = []
unzip' ((x,y):xs) = [x,y] ++ unzip' xs
-}

zip3' :: [a] -> [b] -> [c] -> [(a,b,c)]
zip3' [] _ _ = []
zip3' _ [] _ = []
zip3' _ _ [] = []
zip3' (x:xs) (y:ys) (z:zs)= [(x,y,z)] ++ zip3' xs ys zs

subList :: Eq a => [a] -> [a] -> Bool
subList [] _ = True
subList _ [] = False
subList xs (y:ys) = if xs == [y] ++ ys
                    then True
                    else subList xs ys
