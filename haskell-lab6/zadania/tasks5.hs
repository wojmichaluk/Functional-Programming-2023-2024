import Control.Monad.Trans.Writer.Lazy

--task 2
filterWithLog :: Show a => (a -> Bool) -> [a] -> Writer [String] [a]
filterWithLog _ [] = do
    tell ["filter []"]
    return []
filterWithLog f (x:xs) = do
    tell ["filter " ++ show x]
    filterXs <- filterWithLog f xs
    return $ if f x then x : filterXs else filterXs

--task 3
foldrWithLog :: (Show a) => (a -> a -> a) -> a -> [a] -> Writer [String] a
foldrWithLog _ acc [] = do
    tell ["foldr []"]
    return acc
foldrWithLog f acc (x:xs) = do
    tell ["foldr " ++ show x]
    foldrXs <- foldrWithLog f acc xs
    return $ f (f x acc) foldrXs
