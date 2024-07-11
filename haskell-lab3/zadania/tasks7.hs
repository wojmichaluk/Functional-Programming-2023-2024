import Data.Char

--task 1
onlyOdd [] = []
onlyOdd (x:xs)
    | x `mod` 2 == 0 = onlyOdd xs
    | otherwise      = x : onlyOdd xs

onlyUpper [] = []
onlyUpper (x:xs)
    | fromEnum x >= 65 && fromEnum x <= 91 = x : onlyUpper xs
    | otherwise                       = onlyUpper xs

--task 2
filter' :: (a -> Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs) 
    | p x == True = x : filter' p xs
    | otherwise   = filter' p xs

onlyEven' = filter' (\x -> x `mod` 2 == 0)
onlyOdd' = filter' (\x -> x `mod` 2 /= 0)
--onlyUpper' = filter' (\x -> fromEnum x >= 65 && fromEnum x <= 91) ???

--task 3
--filter zdecydowanie szybciej

--task 4
--length $ onlyEven [1..10^6]
--length $ filter even [1..10^6]

--task 5
--gorzej niż filter, lepiej niż onlyEven
