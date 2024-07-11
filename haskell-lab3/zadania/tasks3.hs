--task 1 - coś nie wychodziło
{-
fact' k = if k = 0 then 1 else k * fact' (k-1)
sumWith :: Num a => (a -> a) -> [a] -> a
sumWith f [] = 0
sumWith f (x:xs) = f x + sumWith f xs

expApproxUpTo :: Int -> Double -> Double
expApproxUpTo n = \x -> sumWith ()
-}

--task 2
dfr :: (Double -> Double) -> Double -> (Double -> Double)
dfr f h = \x -> (f (x + h) - f x) / h

--task 3
dfc :: (Double -> Double) -> Double -> (Double -> Double)
dfc f h = \x -> (f (x + h) - f (x - h)) / (2 * h)

--task 4 ???
d2f :: (Double -> Double) -> Double -> (Double -> Double)
d2f f h = dfc (dfc f h) h
