--task 1
sumSqr' :: Num a => [a] -> a
sumSqr' [] = 0
sumSqr' (x:xs) = x * x + sumSqr' xs

--task 2
sumWith :: Num a => (a -> a) -> [a] -> a
sumWith f [] = 0
sumWith f (x:xs) = f x + sumWith f xs

--task 3
sum'' = sumWith id
sumSqr'' = sumWith (^2)
sumCube'' = sumWith (\x -> x^3)
sumAbs = sumWith abs

--task 4
--sumWith (\x -> x^5) [1..15]

--task 5
listLength = sumWith (\x -> 1)

--task 6
prod' :: Num a => [a] -> a
prod' [] = 1
prod' (x:xs) = x * prod' xs

--task 7
prodWith :: Num a => (a -> a) -> [a] -> a
prodWith f [] = 1
prodWith f (x:xs) = f x * prodWith f xs
prod'' = prodWith id
prodSqr'' = prodWith (^2)
prodCube'' = prodWith (\x -> x^3)
prodAbs = prodWith abs

--task 8 - nie napisałem :-C

--task 9
sumSqrt'' = sumWith sqrt 
prodSqrt'' = prodWith sqrt

