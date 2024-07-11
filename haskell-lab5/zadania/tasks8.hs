import Control.Applicative

--task 1
newtype MyTriple a = MyTriple (a,a,a) deriving Show 

instance Functor MyTriple where 
    fmap f (MyTriple (fst,snd,trd)) = MyTriple (f fst, f snd, f trd)

instance Applicative MyTriple where 
    pure x = MyTriple (x, x, x)
    (MyTriple (fst, snd, trd)) <*> MyTriple (x, y, z) = MyTriple (fst x, snd y, trd z)

--task 2
{-
problem z duplikatem ...
instance Applicative ((->) r) where
  pure x = (\_ -> x)
  f <*> g = \x -> f x (g x)
-}

--task 3
data Tree2 a = EmptyT2 | Leaf a | Node (Tree2 a) a (Tree2 a) deriving Show 

instance Functor Tree2 where
    fmap _ EmptyT2 = EmptyT2
    fmap f (Leaf l) = Leaf (f l)
    fmap f (Node lt n rt) = Node (fmap f lt) (f n) (fmap f rt)

{-
problemy z ostatnią linijką dla <*>
instance Applicative Tree2 where
  pure x = Leaf x
  EmptyT2 <*> _ = EmptyT2
  _ <*> EmptyT2 = EmptyT2
  (Leaf f) <*> tree = fmap f tree
  (Node left f right) <*> tree = Node (left <*> tree) (fmap f tree) (right <*> tree)

wariant z ZipList ???
-}

