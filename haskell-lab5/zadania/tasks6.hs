--task 1
{-# LANGUAGE DeriveFunctor #-}

data MyList a = EmptyList | Cons a (MyList a) deriving (Show, Functor)

--task 2
data BinTree a = EmptyBT | NodeBT a (BinTree a) (BinTree a) deriving (Show, Functor)

{-
instance Functor BinTree where
    fmap _ EmptyBT = EmptyBT
    fmap f (NodeBT n lt rt) = NodeBT (f n) (fmap f lt) (fmap f rt)
-}

--task 3
newtype Pair b a = Pair {getPair :: (a,b)} deriving Show

instance Functor (Pair b) where
  fmap f (Pair (fst, snd)) = Pair (f fst, snd)

data Tree2 a = EmptyT2 | Leaf a | Node (Tree2 a) a (Tree2 a) deriving Show

instance Functor Tree2 where
    fmap _ EmptyT2 = EmptyT2
    fmap f (Leaf l) = Leaf (f l)
    fmap f (Node lt n rt) = Node (fmap f lt) (f n) (fmap f rt)

data GTree a = GLeaf a | GNode [GTree a] deriving Show

{-
nah, z GTree coś się nie lubimy :-C
instance Functor GTree where
    fmap f (GLeaf l) = GLeaf (f l)
    fmap f (GNode (t:rt)) = GNode (fmap f t) (fmap f $ GNode rt)  
-}

--task 4
{-
problem z duplikatem
instance Functor ((->) a) where 
    fmap f g = \x -> f (g x)
-}
