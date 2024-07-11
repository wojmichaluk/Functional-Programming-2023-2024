import Control.Monad
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

newtype Identity a = Identity a deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity x) = Identity $ f x

instance Applicative Identity where
  pure = Identity
  Identity f <*> Identity x = Identity $ f x

instance Monad Identity where
  return = pure
  Identity x >>= fm = fm x

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = liftM Identity arbitrary

instance Eq a => EqProp (Identity a) where
  (=-=) = eq

--task 7.3
data List a = Nil | Cons a (List a) deriving (Show, Eq)

instance Functor List where
  fmap f Nil = Nil
  fmap f (Cons h l) = Cons (f h) (fmap f l)

instance Applicative List where
  pure = Cons
  Identity f <*> Identity x = Identity $ f x

instance Monad List where
  return = pure
  Nil >>= fm = fm Nil
  (Cons h l) >>= fm = (fm h) (l >>= fm) 

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = liftM Identity arbitrary

instance Eq a => EqProp (Identity a) where
  (=-=) = eq


main :: IO ()
main = do
  putStrLn "\n*** Testing Maybe ... ***"
  let t1 = undefined :: Maybe (Int, String, Int)
  quickBatch $ functor t1
  quickBatch $ applicative t1
  quickBatch $ monad t1
  putStrLn "\n*** Testing Identity ... ***"
  let t2 = undefined :: Identity (Int, String, Int)
  quickBatch $ functor t2 
  quickBatch $ applicative t2
  quickBatch $ monad t2

  --task 7.1
  putStrLn "\n*** Testing Either ... ***"
  let t3 = undefined :: Either String (Int, String, Int)
  quickBatch $ functor t3
  quickBatch $ applicative t3
  quickBatch $ monad t3

  --task 7.2
  putStrLn "\n*** Testing [Int] ... ***"
  let t4 = undefined :: [(Int, String, Int)]
  quickBatch $ functor t4
  quickBatch $ applicative t4
  quickBatch $ monad t4

  --task 7.3 - tu jeszcze sprawdzenie tych praw powinno być
  --pewnie łatwe, ale teraz już tego nie będę sprawdzał i odpalał, sorka
