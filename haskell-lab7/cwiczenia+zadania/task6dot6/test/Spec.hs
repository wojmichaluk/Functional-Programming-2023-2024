import Test.QuickCheck
import Control.Monad
import Stack
import Queue

instance Arbitrary a => Arbitrary (Queue a) where
  arbitrary = frequency [ (1, return emptyQ),
                          (3, liftM arbitrary arbitrary ) ]

instance Arbitrary a => Arbitrary (Stack a) where
  arbitrary = frequency [ (1, return empty),
                          (3, liftM arbitrary arbitrary ) ]

prop_PushAndPopShouldNotChangeStackSize :: Stack Int -> Int -> Bool 
prop_PushAndPopShouldNotChangeStackSize s x = size (snd $ pop $ push x s) == size s

prop_AddAndRemShouldNotChangeQueueSize :: Queue Int -> Int -> Bool 
prop_AddAndRemShouldNotChangeQueueSize q x = sizeQ (snd $ remQ $ addQ x q) == sizeQ q
  

main :: IO ()
main = do
  putStrLn "*** Testing prop_PushAndPopShouldNotChangeStackSize... ***"
  quickCheck prop_PushAndPopShouldNotChangeStackSize
