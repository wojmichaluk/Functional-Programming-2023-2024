{-# LANGUAGE DeriveFunctor #-}

newtype Box a = MkBox a deriving (Show, Functor)

{-
instance Functor Box where
    fmap f (MkBox x) = MkBox (f x)
-}

data MyList a = EmptyList | Cons a (MyList a) deriving Show
instance Functor MyList where
    fmap _ EmptyList = EmptyList
    fmap f (Cons x mxs) = Cons (f x) (fmap f mxs)
    
