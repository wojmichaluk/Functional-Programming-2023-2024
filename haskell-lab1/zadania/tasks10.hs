--task 1
unitVec2D :: (Double, Double) -> (Double, Double)
unitVec2D (x,y) = 
    let l = sqrt (x * x + y * y)
    in (x / l, y / l) 

--task 2
unitVec3D :: (Double, Double, Double) -> (Double, Double, Double)
unitVec3D (x,y,z) = 
    let l = sqrt (x * x + y * y + z * z)
    in (x / l, y / l, z / l)

{- this is a
multi-line
comment baby -}

--task 3
triangleArea :: (Double, Double, Double) -> Double
triangleArea (a, b, c) = 
    let p = (a + b + c) / 2
    in sqrt(p*(p-a)*(p-b)*(p-c))
