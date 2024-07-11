module Stack
  ( Stack
  , empty   -- :: Stack a
  , isEmpty -- :: Stack a -> Bool
  , push    -- :: a -> Stack a -> Stack a
  , top     -- :: Stack a -> a
  , pop     -- :: Stack a -> (a,Stack a)
  , size    -- :: Stack a -> Int
  ) where

-- interface (signature, contract)
empty :: Stack a
isEmpty :: Stack a -> Bool
push :: a -> Stack a -> Stack a
top :: Stack a -> a
pop :: Stack a -> (a,Stack a)
size :: Stack a -> Int

-- implementation
newtype Stack a = MkStack [a] deriving Show -- hidden constructor (see the module export list)

empty = MkStack []
isEmpty (MkStack s) = null s
push x (MkStack s) = MkStack (x:s)
top (MkStack s) = head s
pop (MkStack (s:ss)) = (s,MkStack ss)
size (MkStack s) = length s 
