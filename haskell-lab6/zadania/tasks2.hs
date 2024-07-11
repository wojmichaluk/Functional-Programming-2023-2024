import Control.Monad

--task 1
--(>=>) :: (a -> Maybe b) -> (b -> Maybe c) -> a -> Maybe c
--wersja dla Maybe, ale uniwersalna:
--f >=> g = \x -> f x >>= g

--task 3
join :: Maybe (Maybe a) -> Maybe a
join (Just (Just a)) = Just a 
join (Just Nothing) = Nothing
join Nothing = Nothing 

--task 4
safeDiv :: Int -> Int -> Maybe Int 
safeDiv x y | y /= 0    = Just $ x `div` y
            | otherwise = Nothing 

safeSum10DivXi :: [Int] -> Maybe Int
safeSum10DivXi xs = safeSum10DivXi' xs 0

safeSum10DivXi' :: [Int] -> Int -> Maybe Int
safeSum10DivXi' [] acc = Just acc
safeSum10DivXi' (x:xs) acc = case (safeDiv 10 x) of 
    Nothing -> Nothing 
    Just n -> safeSum10DivXi' xs (acc + n)

safeSum10DivXi'' :: [Int] -> Maybe Int
safeSum10DivXi'' xs = do 
    result <- safeSum10DivXi' xs 0
    return result

safeSum10DivXi''' :: [Int] -> Maybe Int
safeSum10DivXi''' xs = safeSum10DivXi' xs 0 >>= \total -> return total

--task 5
safeProduct10DivXi :: [Int] -> Maybe Int
safeProduct10DivXi xs = safeProduct10DivXi' xs 1

safeProduct10DivXi' :: [Int] -> Int -> Maybe Int
safeProduct10DivXi' [] acc = Just acc
safeProduct10DivXi' (x:xs) acc = case (safeDiv 10 x) of 
    Nothing -> Nothing 
    Just n -> safeProduct10DivXi' xs (acc * n)

safeProduct10DivXi'' :: [Int] -> Maybe Int 
safeProduct10DivXi'' xs = do 
    result <- safeProduct10DivXi' xs 1
    return result

safeProduct10DivXi''' :: [Int] -> Maybe Int
safeProduct10DivXi''' xs = 
    safeProduct10DivXi' xs 1 >>= \total -> return total

--dla abs analogiczne rozumowanie

--task 6
safeSum10DivXi'''' :: [Int] -> Maybe Int
safeSum10DivXi'''' xs = 
    foldM (\acc x -> safeDiv 10 x >>= \result -> return (acc + result)) 0 xs

safeProduct10DivXi'''' :: [Int] -> Maybe Int
safeProduct10DivXi'''' xs = 
    foldM (\acc x -> safeDiv 10 x >>= \result -> return (acc * result)) 1 xs

--task 8 niestety nie zapisałem tutaj
