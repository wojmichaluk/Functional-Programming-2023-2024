import Data.Char

--task 1
sqrElems []     = []
sqrElems (x:xs) = x^2 : sqrElems xs

lowerCase []     = []
lowerCase (x:xs) = toLower x : lowerCase xs

--task 2
map' :: (a -> b) -> [a] -> [b]
map' f []     = []
map' f (x:xs) = f x : map' f xs

doubleElems' = map' (*2)
sqrElems' = map' (^2)
lowerCase' = map' (toLower)

--task 3
--doubleElems'' x = [2 * i | i <- x]
--sqrElems'' x = [i * i | i <- x]
--lowerCase'' x = [toLower i | i <- x]

--task 4
--map z biblioteki standardowej szybsze.

--task 5
--length . filter even $ [2 * i | i <- [1..10^7]]
-- ???

--task 7 - coś chyba niezbyt
evalFuncListAt :: a -> [a -> b] -> [b]
evalFuncListAt x [] = []
evalFuncListAt x (f:fs) = f x : evalFuncListAt x fs

--task 8 i task 9 - nie zrobiłem
