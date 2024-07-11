module TestedCode where

import Control.Monad
import Test.QuickCheck

data DaysOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving (Eq, Show)

dayAfter Mon = Tue
dayAfter Tue = Wed
dayAfter Wed = Thu
dayAfter Thu = Fri
dayAfter Fri = Sat
dayAfter Sat = Sun
dayAfter Sun = Mon

instance Arbitrary DaysOfWeek where
  arbitrary = elements [ Mon, Tue, Wed, Thu, Fri, Sat, Sun ]

data List a = Nil | Cons a (List a) deriving (Show, Eq)

--task 6.2
instance Arbitrary a => Arbitrary (List a) where
  arbitrary = frequency $ [(1, return Nil), (4, liftM2 Cons arbitrary arbitrary)]

reverse' :: List a -> List a
reverse' = go Nil
  where go acc Nil = acc
        go acc (Cons x xs) = go (Cons x acc) xs

length' :: List a -> Int
length' Nil = 0
length' (Cons _ xs) = 1 + length' xs

data BinTree a = EmptyBT | NodeBT (BinTree a) a (BinTree a) deriving Show

instance Arbitrary a => Arbitrary (BinTree a) where
   arbitrary = sized arbitraryBinTree

arbitraryBinTree 0 = return EmptyBT
arbitraryBinTree n =
  frequency [ (1, return EmptyBT),
              (3, liftM3 NodeBT (arbitraryBinTree (n `div` 2))
                                arbitrary
                                (arbitraryBinTree (n `div` 2))) ]

insertIntoBinTree :: a -> BinTree a -> BinTree a
insertIntoBinTree x EmptyBT = NodeBT EmptyBT x EmptyBT
insertIntoBinTree x (NodeBT lt a rt) =
  if depthOfBinTree lt <= depthOfBinTree rt
     then NodeBT (insertIntoBinTree x lt) a rt
     else NodeBT lt a (insertIntoBinTree x rt)

depthOfBinTree :: BinTree a -> Int
depthOfBinTree EmptyBT = 0
depthOfBinTree (NodeBT lt _ rt) = 1 + max (depthOfBinTree lt) (depthOfBinTree rt)

elemCountOfBinTree :: BinTree a -> Int
elemCountOfBinTree EmptyBT = 0
elemCountOfBinTree (NodeBT lt x rt) = 1 + elemCountOfBinTree lt + elemCountOfBinTree rt
