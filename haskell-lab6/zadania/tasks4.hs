--task 2
join :: [[a]] -> [a]
join [] = []
join (x:xs) = x ++ join xs
