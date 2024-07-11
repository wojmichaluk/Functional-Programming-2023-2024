--task 1
vec3DLen :: (Double, Double, Double) -> Double
vec3DLen (x,y,z) = sqrt(x^2+y^2+z^2)

--task 2
swap :: (Int, Char) -> (Char, Int)
swap (x, y) = (y,x)

--task 3
threeEqual :: (Int, Int, Int) -> Bool
threeEqual (x, y, z) = (x == y) && (x == z) && (y == z)

--task 4
triangleArea :: (Double, Double, Double) -> Double
triangleArea (a, b, c) = 0.25*sqrt((a+b+c)*(b+c-a)*(a+c-b)*(a+b-c))
