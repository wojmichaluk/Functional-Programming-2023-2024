--task 1
data BinTree a = EmptyBT |
    Node a (BinTree a) (BinTree a)
    deriving (Show)

depthOfBT :: BinTree a -> Int 
depthOfBT EmptyBT = 0
depthOfBT (Node n lt rt) = 1 + max (depthOfBT lt) (depthOfBT rt)

flattenBT :: BinTree a -> [a]
flattenBT EmptyBT = []
flattenBT (Node n lt rt) = flattenBT lt ++ [n] ++ flattenBT rt 

flattenBT' :: BinTree a -> [a]
flattenBT' EmptyBT = []
flattenBT' (Node n lt rt) = [n] ++ flattenBT lt ++ flattenBT rt 

flattenBT'' :: BinTree a -> [a]
flattenBT'' EmptyBT = []
flattenBT'' (Node n lt rt) = flattenBT rt ++ [n] ++ flattenBT lt 

mapBT :: (a -> b) -> BinTree a -> BinTree b 
mapBT f EmptyBT = EmptyBT
mapBT f (Node n lt rt) = Node (f n) (mapBT f lt) (mapBT f rt)

insert :: Ord a => a -> BinTree a -> BinTree a 
insert x EmptyBT = Node x EmptyBT EmptyBT
insert x (Node n lt rt) =
    if x < n then (Node n (insert x lt) rt)
    else (Node n lt (insert x rt)) 

--task 2
occurs :: Eq a => a -> BinTree a -> Int
occurs x EmptyBT = 0
occurs x (Node n lt rt) = if x == n then
    1 + (occurs x lt) + (occurs x rt)
    else (occurs x lt) + (occurs x rt)

elemOf :: Eq a => a -> BinTree a -> Bool
elemOf x EmptyBT = False
elemOf x (Node n lt rt) = if x == n then True
    else (elemOf x lt) || (elemOf x rt)

reflect :: BinTree a -> BinTree a
reflect EmptyBT = EmptyBT
reflect (Node n lt rt) = (Node n (reflect rt) (reflect lt))

{- oj coś nie wychodzi
minElemOf :: Ord a => BinTree a -> a
minElemOf EmptyBT = 1/0
minElemOf (Node n lt rt) = min (n (minElemOf lt) (minElemOf rt))
???

maxElemOf :: Ord a => BinTree a -> a
maxElemOf EmptyBT = (-1/0)
maxElemOf (Node n lt rt) = max (n (maxElemOf lt) (maxElemOf rt))
???
-}

--patrząc na sygnatury, nie chciało mi się nawet zaczynać
--list2BST :: Ord a => [a] -> Maybe (BinTree a)
--foldBinTree :: (a -> b -> b -> b) -> b -> BinTree a -> b 
--unfoldBinTree :: (a -> Maybe (a, b, a)) -> a -> BinTree b

createBinTree :: Int -> BinTree Int 
createBinTree 0 = EmptyBT
createBinTree x = Node x (createBinTree $ x-1) (createBinTree $ x-1)

--labelBinTree :: BinTree a -> BinTree (a, Int) - nie chciało mi się

{- a tu akurat się zamotałem
isBST :: Ord a => BinTree a -> Bool
isBST EmptyBT = True
isBST (Node n lt rt) = if n ... ??? 
-}

--task 3 - ups

--task 4
{- marna to propozycja...
zipBT :: Num a => BinTree a -> BinTree a -> BinTree a
zipBT EmptyBT EmptyBT = EmptyBT
zipBT (Node n lt rt) EmptyBT = (Node n lt rt)
zipBT EmptyBT (Node n lt rt) = (Node n lt rt)
zipBT (Node n lt rt) (Node n2 lt2 rt2) = ... ???
-}

--task 5
data GTree a = Leaf a | GNode [GTree a]
    deriving Show

sumGTree :: Num a => GTree a -> a
sumGTree (Leaf x) = x
sumGTree (GNode (x:xs)) = sumGTree x + sumGTree (GNode xs) 
    
elemOfGTree :: Eq a => a -> GTree a -> Bool 
elemOfGTree x (Leaf y) = if x==y then True else False 
elemOfGTree x (GNode (y:ys)) = elemOfGTree x y ||
    elemOfGTree x (GNode ys)

depthOfGTree :: GTree a -> Int 
depthOfGTree (Leaf x) = 1
depthOfGTree (GNode (x:xs)) = 1 + max (depthOfGTree x) (depthOfGTree (GNode xs))

{- Hmm...
mapGTree :: (a -> b) -> GTree a -> GTree b 
mapGTree f (Leaf x) = Leaf $ f x
mapGTree f (GNode (x:xs)) = (mapGTree f x) (mapGTree f (GNode xs)) ... ???
-}

--sory nie chciało mi się
--flattenGTree :: GTree a -> [a]
--countGTreeLeaves :: GTree a -> Int

--task 6
data Expr a = Lit a | 
    Add (Expr a) (Expr a) |
    Sub (Expr a) (Expr a) |
    Mul (Expr a) (Expr a)

eval :: Num a => Expr a -> a 
eval (Lit n) = n 
eval (Add e1 e2) = eval e1 + eval e2 
eval (Sub e1 e2) = eval e1 - eval e2 
eval (Mul e1 e2) = eval e1 * eval e2 

show' :: Show a => Expr a -> String
show' (Lit n) = show n 
show' (Add e1 e2) = "(" ++ show' e1 ++ "+" ++ show' e2 ++ ")"
show' (Sub e1 e2) = "(" ++ show' e1 ++ "-" ++ show' e2 ++ ")"
show' (Mul e1 e2) = "(" ++ show' e1 ++ "*" ++ show' e2 ++ ")"

--task 7
data Expr' a = Lit' a |
    Expr' a :+: Expr' a |
    Expr' a :-: Expr' a |
    Expr' a :*: Expr' a 

eval' :: Num a => Expr' a -> a 
eval' (Lit' n) = n 
eval' (e1 :+: e2) = eval' e1 + eval' e2 
eval' (e1 :-: e2) = eval' e1 - eval' e2 
eval' (e1 :*: e2) = eval' e1 * eval' e2 

show'' :: Show a => Expr' a -> String
show'' (Lit' n) = show n 
show'' (e1 :+: e2) = "(" ++ show'' e1 ++ "+" ++ show'' e2 ++ ")"
show'' (e1 :-: e2) = "(" ++ show'' e1 ++ "-" ++ show'' e2 ++ ")"
show'' (e1 :*: e2) = "(" ++ show'' e1 ++ "*" ++ show'' e2 ++ ")"

--task 8
data Expr'' a = Lit'' a |
    Op Ops (Expr'' a) (Expr'' a) |
    If (BExpr'' a) (Expr'' a) (Expr'' a)

data Ops = Add'' | Sub'' | Mul''
data BExpr'' a = BoolLit'' Bool |
    And (BExpr'' a) (BExpr'' a) |
    Or (BExpr'' a) (BExpr'' a)
    -- etc.

eval'' :: Num a => Expr'' a -> a 
eval'' (Lit'' n) = n
eval'' (Op Add'' e1 e2) = eval'' e1 + eval'' e2
eval'' (Op Sub'' e1 e2) = eval'' e1 - eval'' e2
eval'' (Op Mul'' e1 e2) = eval'' e1 * eval'' e2

bEval'' :: BExpr'' a -> Bool 
bEval'' (BoolLit'' b) = b 
bEval'' (And e1 e2) = bEval'' e1 && bEval'' e2
bEval'' (Or e1 e2) = bEval'' e1 || bEval'' e2
