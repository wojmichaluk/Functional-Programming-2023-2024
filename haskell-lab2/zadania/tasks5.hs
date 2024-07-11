--task 1
--length [(a,b,c)| a <- [1..100], b <- [a+1..100], c <- [b+1..100], a^2 + b^2 == c^2]

--task 2
isPrime :: Integral t => t -> Bool
isPrime n = [i | i <- [2..n-1], n `mod` i == 0] == []
--funkcja działa dla n>=2, ale nie jest to efektywna implementacja

--task 3
--length [a | a <- [2..10000], [i | i <- [2..a-1], a `mod` i == 0] == []]

--task 4
primes :: Int -> [Int]
primes n = eratoSieve [2..n]
   where eratoSieve :: [Int] -> [Int]
         eratoSieve [] = []
         eratoSieve (p : xs) = p : eratoSieve [x | x <- xs, x `mod` p /= 0]

isPrime' :: Int -> Bool
isPrime' n = n `elem` primes n

--task 5
howManyPrimes :: Int -> Int
howManyPrimes n = length (primes n)

--task 6
allEqual :: Eq a => [a] -> Bool
allEqual [] = True
allEqual (x:xs) = all (==x) xs 
