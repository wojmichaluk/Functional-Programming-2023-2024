--task 1
roots :: (Double, Double, Double) -> (Double, Double)
roots (a,b,c) = ((-b - d) / e, (-b + d) / e)
    where {d = sqrt (b * b - 4 * a * c);
        e = 2 * a}

--task 2
{- comments added to files 
tasks9.hs and tasks10.hs -}

--task 3
roots_l :: (Double, Double, Double) -> (Double, Double)
roots_l (a,b,c) = 
    let {d = sqrt (b * b - 4 * a * c);
    e = 2 * a}
    in ((-b - d) / e, (-b + d) / e)
