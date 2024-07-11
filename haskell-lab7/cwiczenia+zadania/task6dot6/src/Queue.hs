module Queue
    ( Queue
    , emptyQ   -- :: Queue a
    , isEmptyQ -- :: Queue a -> Bool
    , addQ     -- :: a -> Queue a -> Queue a
    , remQ     -- :: Queue a -> (a, Queue a)
    , sizeQ     -- :: Queue a -> Int
    ) where 

-- interface (signature, contract)
emptyQ :: Queue a
isEmptyQ :: Queue a -> Bool
addQ :: a -> Queue a -> Queue a
remQ :: Queue a -> (a, Queue a)
sizeQ :: Queue a -> Int

-- implementation
newtype Queue a = MkQueue [a] deriving Show
-- hidden constructor (see the module export list)

emptyQ = MkQueue []
isEmptyQ (MkQueue q) = null q 
addQ x (MkQueue q) = MkQueue (q ++ [x]) 
remQ (MkQueue (q:qq)) = (q,MkQueue qq)
sizeQ (MkQueue q) = length q
