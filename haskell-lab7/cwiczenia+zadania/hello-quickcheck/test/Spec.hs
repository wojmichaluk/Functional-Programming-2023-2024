import Test.QuickCheck

prop_plusAssociativeInt :: Int -> Int -> Int -> Bool
prop_plusAssociativeInt x y z = x + (y + z) == (x + y) + z

prop_reverse :: [Int] -> Bool
prop_reverse xs = reverse (reverse xs) == xs

prop_halfIdentity :: Double -> Bool
prop_halfIdentity x = ((* 2) . (/ 2) $ x) == x

--task 2.1
prop_plusAssociativeDouble :: Double -> Double -> Double -> Bool
prop_plusAssociativeDouble x y z = x + (y + z) == (x + y) + z

--task 2.2
prop_plusCommutativeInt :: Int -> Int -> Bool
prop_plusCommutativeInt x y = x + y == y + x

prop_plusCommutativeDouble :: Double -> Double -> Bool
prop_plusCommutativeDouble x y = x + y == y + x

--task 2.3
prop_headReverse :: Int -> Bool
prop_headReverse x = reverse [x] == [x]

prop_reverseDisjointnessIncorrect :: [Int] -> [Int] -> Bool
prop_reverseDisjointnessIncorrect xs ys = reverse (xs ++ ys) == reverse xs ++ reverse ys

--task 2.4
prop_reverseDisjointness :: [Int] -> [Int] -> Bool
prop_reverseDisjointness xs ys = reverse (xs ++ ys) == reverse ys ++ reverse xs


main :: IO ()
main = do
  putStrLn "\n*** Testing prop_plusAssociativeInt... ***"
  verboseCheck (withMaxSuccess 1000 prop_plusAssociativeInt)
  putStrLn "\n*** Testing prop_reverse... ***"
  verboseCheck (withMaxSuccess 500 prop_reverse)
  putStrLn "\n*** Testing prop_halfIdentity... ***"
  verboseCheck prop_halfIdentity

  --task 2.1
  putStrLn "\n*** Testing prop_plusAssociativeDouble... ***"
  quickCheck prop_plusAssociativeDouble

  --task 2.2
  putStrLn "\n*** Testing prop_plusCommutativeInt... ***"
  quickCheck (withMaxSuccess 10000 prop_plusCommutativeInt)
  putStrLn "\n*** Testing prop_plusCommutativeDouble... ***"
  quickCheck (withMaxSuccess 10000 prop_plusCommutativeDouble)

  --task 2.3
  putStrLn "\n*** Testing prop_headReverse... ***"
  quickCheck (withMaxSuccess 1000 prop_headReverse)
  putStrLn "\n*** Testing prop_reverseDisjointnessIncorrect... ***"
  quickCheck (withMaxSuccess 1000 prop_reverseDisjointnessIncorrect)

  --task 2.4
  putStrLn "\n*** Testing prop_reverseDisjointness... ***"
  quickCheck (withMaxSuccess 50000 prop_reverseDisjointness)
