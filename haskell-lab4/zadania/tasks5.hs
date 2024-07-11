--task 1
newtype MyInt = MkMyInt Int

instance Eq MyInt where
    (==) (MkMyInt i1) (MkMyInt i2) = i1 == i2 

instance Ord MyInt where
    (<=) (MkMyInt i1) (MkMyInt i2) = i1 <= i2 

instance Num MyInt where 
    (+) (MkMyInt i1) (MkMyInt i2) = MkMyInt (i1 + i2)
    (-) (MkMyInt i1) (MkMyInt i2) = MkMyInt (i1 - i2)
    (*) (MkMyInt i1) (MkMyInt i2) = MkMyInt (i1 * i2)
    negate (MkMyInt i) = MkMyInt (negate i)
    abs (MkMyInt i) = MkMyInt (abs i)
    signum (MkMyInt i) = MkMyInt (signum i)
    fromInteger int = MkMyInt (fromIntegral int)

instance Show MyInt where 
    show (MkMyInt i) = "MkMyInt " ++ show i

--task 2
data BinTree a = EmptyBT |
    Node a (BinTree a) (BinTree a)
    deriving (Show)

instance Eq a => Eq (BinTree a) where 
    (==) (EmptyBT) (EmptyBT) = True
    (==) (EmptyBT) _ = False
    (==) _ (EmptyBT) = False
    (==) (Node n1 lt1 rt1) (Node n2 lt2 rt2) = 
        n1 == n2 && lt1 == lt2 && rt1 == rt2 

--task 3
data Cart3DVec a = Cart3DVec a a a
    -- deriving Ord

instance Eq a => Eq (Cart3DVec a) where 
    (==) (Cart3DVec x1 y1 z1) (Cart3DVec x2 y2 z2) = 
        x1 == x2 && y1 == y2 && z1 == z2 

instance Num a => Num (Cart3DVec a) where 
    (+) (Cart3DVec x1 y1 z1) (Cart3DVec x2 y2 z2) = Cart3DVec (x1+x2) (y1+y2) (z1+z2)
    (-) (Cart3DVec x1 y1 z1) (Cart3DVec x2 y2 z2) = Cart3DVec (x1-x2) (y1-y2) (z1-z2)
    (*) (Cart3DVec x1 y1 z1) (Cart3DVec x2 y2 z2) = Cart3DVec (x1*x2) (y1*y2) (z1*z2)
    negate (Cart3DVec x y z) = Cart3DVec (negate x) (negate y) (negate z)
    abs (Cart3DVec x y z) = Cart3DVec (abs x) (abs y) (abs z)
    signum (Cart3DVec x y z) = Cart3DVec (signum x) (signum y) (signum z)
    fromInteger int = Cart3DVec (fromIntegral int) (fromIntegral int) (fromIntegral int)

instance Show a => Show (Cart3DVec a) where 
    show (Cart3DVec x y z) = "(" ++ show x ++ "," ++ show y ++ "," ++ show z ++ ")"

--task 4 - schematyczne, nie chciało mi się robić

--task 5
instance Ord a => Ord (Cart3DVec a) where
    (<=) (Cart3DVec x1 y1 z1) (Cart3DVec x2 y2 z2) =
        x1 <= x2 && y1 <= y2 && z1 <= z2

--task 6
newtype MyDouble = MkMyDouble Double
    deriving (Eq, Ord, Num, Show)

{-
instance Eq MyDouble where
    (==) (MkMyDouble d1) (MkMyDouble d2) = d1 == d2 

instance Ord MyDouble where
    (<=) (MkMyDouble d1) (MkMyDouble d2) = d1 <= d2 

instance Num MyDouble where 
    (+) (MkMyDouble d1) (MkMyDouble d2) = MkMyDouble (d1 + d2)
    (-) (MkMyDouble d1) (MkMyDouble d2) = MkMyDouble (d1 - d2)
    (*) (MkMyDouble d1) (MkMyDouble d2) = MkMyDouble (d1 * d2)
    negate (MkMyDouble d) = MkMyDouble (negate d)
    abs (MkMyDouble d) = MkMyDouble (abs d)
    signum (MkMyDouble d) = MkMyDouble (signum d)
    fromInteger double = MkMyDouble (fromIntegral double)

instance Show MyDouble where 
    show (MkMyDouble d) = "MkMyDouble " ++ show d
-}

--task 7 - nie zrobiłem

--task 8 - nie zrobiłem
{-
data BinTree' a = EmptyBT' |
    Node' a (BinTree' a) (BinTree' a)
    deriving (Eq, Ord)
-}
