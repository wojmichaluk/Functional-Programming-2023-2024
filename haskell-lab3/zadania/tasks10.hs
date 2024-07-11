import Data.List

--ogólnie to zip i unzip fajne, ale moje iq spada o połowę (i wtedy wynosi 30)
--kiedy mam zrobić zadanie z użyciem czegoś co jest nienaturalne bo na ez
--da się zrobić bez używania tego

--task 1 ???
isSortedAsc :: Ord a => [a] -> Bool
isSortedAsc xs = xs == (sort xs)

--task 2 ???
everySecond :: [t] -> [t]
everySecond xs = []

--task 3 ???
--zip3' :: [a] -> [b] -> [c] -> [(a,b,c)]


--unzip3' :: [(a,b,c)] -> ([a], [b], [c])


isSortedDesc :: Ord a => [a] -> Bool
isSortedDesc xs = xs == (reverse . sort) xs

isSorted :: Ord a => [a] -> Bool
isSorted xs = isSortedAsc xs || isSortedDesc xs
