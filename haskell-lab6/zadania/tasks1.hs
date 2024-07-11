--task 1
extractMaybe :: Maybe a -> a
extractMaybe Nothing = error "Nothing inside!"
extractMaybe (Just x) = x

-- (>^$>) = extract (^) and apply ($)
(>^$>) :: Maybe a -> (a -> Maybe b) -> Maybe b
Nothing >^$> _ = Nothing 
(Just x) >^$> f = f x 
infixl 1 >^$>

--zakomentowanie wynika z tego, żeby nie było duplikatów
-- Kleisli Composition 
--(>.>>) :: (a -> Maybe b) -> (b -> Maybe c) -> (a -> Maybe c)

--do zmiany:
--f >.>> g = \x -> g (extractMaybe (f x))

--nowa wersja:
--f >.>> g = \x -> (f x) >^$> g 

--task 2
joinMaybe :: Maybe (Maybe a) -> (Maybe a)
joinMaybe (Just (Just x)) = Just x 

f >.>> g = \x -> joinMaybe $ fmap g (f x)  

--task 3
-- ???
--Nie wiem czy jest taka możliwość,
--ale jest to podejście niezalecane.

--task 4
{- niestety coś się pierniczy
f :: a -> (b, String)
f x = (2 * x, "nw czy o to tu chodzilo")

g :: b -> (c, String)
g x = (2 * x,"no chyba na pewno nie")

extract :: (a, String) -> a
extract (x,s) = x 

insert :: a -> (a, String)
insert x = (x,"dziwne to zadanie")

(>^$>) :: (a, String) -> (a -> (b, String)) -> (b, String)
(x,s) >^$> f = f x 
infixl 1 >^$>

(>.>>) :: (a -> (b, String)) -> (b -> (c, String)) -> (a -> (c, String))
f >.>> g = \x -> (f x) >^$> g
-}  
