--task 1
let f1 = \x -> x - 2
let f2 = \x y -> sqrt(x * x + y * y)
let f3 = \x -> \y -> \z -> sqrt(x * x + y * y + z * z)

--task 2
let g1 = \x -> (2*) x
let g2 = \x -> (*2) x 
let g3 = \x -> (2^) x
let g4 = \x -> (^2) x
let g5 = \x -> (2/) x 
let g6 = \x -> (/3) x
let g7 = \x -> (4-) x 

--task 3
--let sqrt' = \x -> sqrt x ???
let abs' = \x -> if x >= 0 then x else -x
--let log' = \x -> log x ???
let id' = \x -> x
let const' = \x -> \y -> x

--task 4
let f7 = \x -> if x `mod` 2 == 0 then True else False
let f8 = \x -> let y = sqrt x in 2 * y^3 * (y + 1)
--let f9 = \x -> if x == 1 then 3 else 0 ???
