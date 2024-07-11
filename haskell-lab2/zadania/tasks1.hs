--task 1
add2C :: Num a => (a -> (a -> a))
add2C x y = x + y

--task 2 - w pliku ex1.hs

--task 3 - nw o to chodziło? xD
add3C' :: Num a =>(a ->(a -> (a -> (a))))
add3C' x y z = x + y + z

{-
task 4 - nie działa :-C
curry2 :: ((a, b) -> c) -> a -> b -> c
curry2 f (x, y) = f x y

uncurry2 :: (a -> b -> c) -> (a, b) -> c
uncurry2 f x y = f (x, y)

curry3 :: ((a, b, c) -> d) -> a -> b -> c -> d
curry3 f (x, y, z) = f x y z

uncurry3 :: (a -> b -> c -> d) -> (a, b, c) -> d
uncurry3 f x y z = f (x, y, z)
-}
