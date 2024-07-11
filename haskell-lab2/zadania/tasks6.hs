import Data.List

--zadania z punktu 4 są w pliku ex6.hs

--task 1
prod' :: Num a => [a] -> a
prod' [] = 1
prod' (x:xs) = x * prod' xs

length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs

or' :: [Bool] -> Bool
or' [] = False
or' (x:xs) = if x == True then True
             else or' xs

and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = if x == False then False
             else and' xs

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' e (x:xs) = if e == x then True
                 else elem' e xs

doubleAll :: Num t => [t] -> [t]
doubleAll [] = []
doubleAll (x:xs) = [2 * x] ++ doubleAll xs

squareAll :: Num t => [t] -> [t]
squareAll [] = []
squareAll (x:xs) = [x^2] ++ squareAll xs

selectEven :: Integral t => [t] -> [t]
selectEven [] = []
selectEven (x:xs) = if x `mod` 2 == 0
                    then [x] ++ selectEven xs
                    else selectEven xs

--task 2
--coś koło 9 milionów

--task 3
avg' :: (Real a1, Fractional a2) => [a1] -> a2
avg' [] = 0
avg' xs = realToFrac (sum xs) / genericLength xs

--task 4
geoAvg [] = 0
geoAvg xs = (realToFrac (product xs)) ** (realToFrac (1) / genericLength xs)

both xs = (avg' xs, geoAvg xs)