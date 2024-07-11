--task 1
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f z [] = z
foldr' f z (x:xs) = f x (foldr' f z xs) 

sumWith'' g = foldr' (\x acc -> g x + acc) 0
prodWith'' g = foldr' (\x acc -> g x * acc) 1

--task 2
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f z [] = z
foldl' f z (x:xs) = foldl' f (f z x) xs

sumWith''' g = foldl' (\acc x -> g x + acc) 0
prodWith''' g = foldl' (\acc x -> g x * acc) 1

--task 3
--foldr szybszy

--task 4
--najszybsze sum . map (+1) $ [1..10^6]
--najwolniejsze foldr (\x acc -> x + 1 + acc) 0 [1..10^6]

--task 7
map' f [] = []
map' f xs = foldr (\x xs -> (f x) : xs) [] xs
--map'' f [] = []
--map'' f xs = foldl (\xs x -> xs : (f x)) [] xs ???
filter' p [] = []
filter' p xs = foldr (\x xs -> if p x then x : xs else xs) [] xs
--filter'' p [] = []
--filter'' p xs = foldl (\xs x -> if p x then xs : x else xs) [] xs ???
--??? wtf nie umiem tych dalszych co to ma być..
