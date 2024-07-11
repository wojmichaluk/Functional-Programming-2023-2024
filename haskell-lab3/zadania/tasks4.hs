--task 1
funcListExt :: [Double -> Double]
funcListExt = [ \x -> (sin x)/x, \x -> log x + sqrt x + 1, \x -> (exp 1) ** x, \x -> sqrt (1 + x)]

evalFuncListAt :: a -> [a -> b] -> [b]
evalFuncListAt x [] = []
evalFuncListAt x (f:fs) = f x : evalFuncListAt x fs

--task 2 - nie zrobiłem
