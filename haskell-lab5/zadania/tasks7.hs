--task 2
liftA (^2) (Just 3)
liftA2 (\x y -> x + y) [1,2] [10,11]
liftA2 (\x y -> max x y) [1,10] [3,9]
liftA2 (,) (Just 4) (Just 2)
liftA3 (\x y z -> x + y + z) (Right 1) (Right 2) (Right 3)

