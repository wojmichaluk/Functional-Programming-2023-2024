--task 1
fiveToPower_ :: Integer -> Integer
fiveToPower_ x = 5 ^ x

_ToPower5 :: Num a => a -> a
_ToPower5 x = x ^ 5

subtrNFrom5 :: Num a => a -> a
subtrNFrom5 x = 5 - x

subtr5From_ :: Num a => a -> a
subtr5From_ x = x - 5

--task 2
flip2 :: (a -> b -> c) -> b -> a -> c
flip2 f = g
      where g x y = f y x 

--task 3
flip3 :: (a -> b -> c -> d) -> c -> b -> a -> d
flip3 f = g
      where g x y z = f z y x
