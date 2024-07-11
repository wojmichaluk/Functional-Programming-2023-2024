import Test.QuickCheck
import TestedCode

prop_WeekCycle d = sevenTimesNext d == d
  where sevenTimesNext d' = iterate dayAfter d' !! 7

prop_RevRevList_Eq_List :: List Int -> Bool
prop_RevRevList_Eq_List xs = reverse' (reverse' xs) == xs

prop_RevRevList_Eq_List2 :: List Int -> Property
prop_RevRevList_Eq_List2 xs = collect (length' xs) $ reverse' (reverse' xs) == xs

prop_InsToBinTreeIncrItsDepthByAtMost1 :: a -> BinTree a -> Bool
prop_InsToBinTreeIncrItsDepthByAtMost1 x t0 =
  depthOfBinTree (insertIntoBinTree x t0) - depthOfBinTree t0 <= 1

--task 6.3
prop_InsToBinTreeIncrItsSizeBy1 :: a -> BinTree a -> Bool 
prop_InsToBinTreeIncrItsSizeBy1 e tr = 
  elemCountOfBinTree (insertIntoBinTree e tr) - elemCountOfBinTree tr == 1


main :: IO ()
main = do
  putStrLn "\n*** Testing prop_WeekCycle... ***"
  quickCheck prop_WeekCycle
  putStrLn "\n*** Testing prop_RevRevList_Eq_List... ***"
  quickCheck prop_RevRevList_Eq_List
  putStrLn "\n*** Testing prop_RevRevList_Eq_List2... ***"
  quickCheck prop_RevRevList_Eq_List2
  putStrLn "\n*** Testing prop_InsToBinTreeIncrItsDepthByAtMost1... ***"
  quickCheck (prop_InsToBinTreeIncrItsDepthByAtMost1 :: Int -> BinTree Int -> Bool)

  --task 6.1
  putStrLn "\n*** Testing prop_WeekCycle... ***"
  verboseCheck (withMaxSuccess 10 prop_WeekCycle)

  --task 6.3
  putStrLn "\n*** Testing prop_InsToBinTreeIncrItsSizeBy1... ***"
  quickCheck (prop_InsToBinTreeIncrItsSizeBy1 :: Int -> BinTree Int -> Bool)
