--task 1
data Cart3DVec a = Cart3DVec a a a 

xCoord :: Cart3DVec a -> a 
xCoord (Cart3DVec x _ _) = x 

yCoord :: Cart3DVec a -> a 
yCoord (Cart3DVec _ y _) = y 

zCoord :: Cart3DVec a -> a
zCoord (Cart3DVec _ _ z) = z 

--task 2
data Cart3DVec' a = MkCart3DVec' {x::a, y::a, z::a}

--task 3
data Polar2DVec a = MkPolar2DVec a a

rCoord :: Polar2DVec a -> a 
rCoord (MkPolar2DVec r _) = r 

phiCoord :: Polar2DVec a -> a
phiCoord (MkPolar2DVec _ phi) = phi 

data Polar2DVec' a = MkPolar2DVec' {r::a, phi::a}

{-
--task 4
data Cart2DVec a = MkCart2DVec a a
data Cart2DVec' a = MkCart2DVec' {x1::a, y1::a}

polarToCartesian :: Polar2DVec a -> Cart2DVec a 
polarToCartesian (MkPolar2DVec r phi) = 
    MkCart2DVec (r * cos phi) (r * sin phi)

polarToCartesian' :: Polar2DVec' a -> Cart2DVec' a
polarToCartesian' (MkPolar2DVec' r phi) =
    MkCart2DVec' (r * cos phi) (r * sin phi) 
-}

--task 5
--analogicznie

--task 6
data Shape = Circle Float |
             Rectangle Float Float

area :: Shape -> Float 
area (Circle r) = pi * r * r 
area (Rectangle a b) = a * b 

--task 7
data Tree a = EmptyT |
              Node a (Tree a) (Tree a)
              deriving Show
              
rootValue :: Tree a -> a 
rootValue EmptyT = error "root: the empty tree has no root!"
rootValue (Node a lt rt) = a 

--task 8
data TrafficLights = Red | Yellow | Green

actionFor :: TrafficLights -> String
actionFor Red = "Stuj"
actionFor Yellow = "Przyspiesz"
actionFor Green = "Gaz do dechy"

--task 9 - nie chciało mi się robić, ale chyba łatwe
