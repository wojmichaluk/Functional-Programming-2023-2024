--task 1 ??? dobrze mi idzie
--concat'' = foldr (++) []
--concat''' = 

--task 2 
--concat . map (*2) $ [1..5] ???
--concatMap (\x -> [(*2)]) [1..5] ???
concatMap (\s -> s ++ "!") ["Ready","Steady","Go"]
