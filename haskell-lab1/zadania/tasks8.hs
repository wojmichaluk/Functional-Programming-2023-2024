--task 1
isItTheAnswer :: String -> Bool
isItTheAnswer t =
    case (t == "Love") of 
        True -> True
        _    -> False

not' :: Bool -> Bool
not' n =
    case n of
        True -> False
        _    -> True

or' :: (Bool, Bool) -> Bool
or' (f,s) =
    case (f,s) of
        (False, False) -> False
        _              -> True

and' :: (Bool, Bool) -> Bool
and' (f,s) =
    case (f,s) of
        (True, True) -> True
        _            -> False

nand' :: (Bool, Bool) -> Bool
nand' (f,s) =
    case (f,s) of
        (True, True) -> False
        _            -> True

xor' :: (Bool, Bool) -> Bool
xor' (f,s) =
    case (f,s) of
        (True, False) -> True
        (False, True) -> True
        _             -> False
