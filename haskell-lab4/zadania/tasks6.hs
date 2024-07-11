--task 1
class Mappable t where 
    fMap :: (a -> b) -> t a -> t b

data BinTree a = EmptyBT |
    NodeBT a (BinTree a) (BinTree a)
    deriving Show 

instance Mappable BinTree where 
    fMap f (EmptyBT) = EmptyBT
    fMap f (NodeBT n lt rt) = 
        NodeBT (f n) (fMap f lt) (fMap f rt)

--task 2
instance Mappable Maybe where 
    fMap f Nothing = Nothing
    fMap f (Just x) = Just (f x)

--task 3
instance Mappable (Either a) where 
    fMap f (Left x) = Left x
    fMap f (Right x) = Right (f x)

--task 4 - co to jest wtf

--task 5
data Vec2D a = Vec2D {x::a, y::a}
    deriving Show

class VectorLike t where 
    (|==|) :: Eq a => t a -> t a -> Bool
    (|+|), (|-|) :: (Num a) => t a -> t a -> t a
    (|*|) :: (Num a) => t a -> t a -> a
    (||?), (|-?) :: (Num a, Eq a) => t a -> t a -> Bool 
    vectLength :: Floating a => t a -> a 
    unitVectOf :: Floating a => t a -> t a 

instance VectorLike Vec2D where
    (|==|) (Vec2D x1 y1) (Vec2D x2 y2) = x1 == x2 && y1 == y2 
    (|+|) (Vec2D x1 y1) (Vec2D x2 y2) = Vec2D (x1+x2) (y1+y2)
    (|-|) (Vec2D x1 y1) (Vec2D x2 y2) = Vec2D (x1-x2) (y1-y2)
    (|*|) (Vec2D x1 y1) (Vec2D x2 y2) = x1*x2 + y1*y2
    (||?) (Vec2D x1 y1) (Vec2D x2 y2) = x1*y2 == x2*y1
    (|-?) v1 v2 = v1 |*| v2 == 0 
    vectLength (Vec2D x y) = sqrt (x**2 + y**2) 
    unitVectOf (Vec2D x y) = Vec2D(x / vectLength (Vec2D x y)) (y / vectLength (Vec2D x y))

-- Vec3D analogicznie
