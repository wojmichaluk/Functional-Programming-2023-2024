import Test.QuickCheck

--zadanie 2
listGen :: Gen [Int]
listGen = oneof [return [], (:) <$> arbitrary <*> listGen]

generateListGen :: IO [Int]
generateListGen = generate $ listGen

--zadanie 3
listGen' :: Gen [Int]
listGen' = frequency [(1,return []), (4,(:) <$> arbitrary <*> listGen)]

generateListGen' :: IO [Int]
generateListGen' = generate $ listGen'