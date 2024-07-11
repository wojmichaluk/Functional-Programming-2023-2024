--task 1
unitVec2D :: (Double, Double) -> (Double, Double)
unitVec2D (x,y) = (x / l, y / l)
    where l = sqrt (x * x + y * y)

--task 2
unitVec3D :: (Double, Double, Double) -> (Double, Double, Double)
unitVec3D (x,y,z) = (x / l, y / l, z / l)
    where l = sqrt (x * x + y * y + z * z)

--task 3
triangleArea :: (Double, Double, Double) -> Double
triangleArea (a, b, c) = sqrt(p*(p-a)*(p-b)*(p-c))
    where p = (a + b + c) / 2

{- You didn't expect
a multi-line block
comment
here! -}