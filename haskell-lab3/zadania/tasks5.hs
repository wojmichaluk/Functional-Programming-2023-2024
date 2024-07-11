import Data.List

--task 1
sortDesc :: Ord a => [a] -> [a]
sortDesc xs = (reverse . sort) xs

--task 2
sortDesc' :: Ord a => [a] -> [a]
sortDesc' xs = reverse (sort xs)

--task 3
--let w3 = \x y z -> sqrt (x^2 + y^2 + z^2)
--(f . w3 1 2 . h) 3

--task 4 ???
are2FunsEqAt :: Eq a => (t -> a) -> (t -> a) -> [t] -> Bool
are2FunsEqAt f g [] = True
are2FunsEqAt f g (x:xs) = (f x == g x) || are2FunsEqAt f g xs

--task 5
infixl 9 >.>
(>.>) :: (a -> b) -> (b -> c) -> (a -> c)
g >.> f = f . g

--task 6
composeFunList :: [a -> a] -> (a -> a)
composeFunList [] = id
composeFunList (x:xs) = x . composeFunList xs

--task 7
--let f1 = (+1)
--let f2 = (+2)
--let g1 x y = x * y
--let g2 x y = (x + y)
--np. (((.) . (.)) f2 g2) 1 2 -- == 5
