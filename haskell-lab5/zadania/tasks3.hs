--task 1
ioActionFactory :: Int -> String -> IO ()
ioActionFactory n = case n of
    1 -> \name -> putStrLn ("Good morning, " ++ name)
    2 -> \name -> putStrLn ("Good afternoon, " ++ name)
    3 -> \name -> putStrLn ("Good night, " ++ name)
    _ -> \name -> putStrLn ("Hello, " ++ name)

actionList :: [IO ()]
actionList = [ioActionFactory 1 "Ben",
              ioActionFactory 2 "Joe",
              ioActionFactory 3 "Ally"]

sequence' :: [IO ()] -> IO ()
sequence' = foldr (>>) (return ())

--task2
--nie wiem czy o to chodziło
sequence'' :: [IO ()] -> IO ()
sequence'' = foldr (\acc action -> acc >> action) (return ())

--task 3
sequence''' :: [IO ()] -> IO ()
sequence''' = foldr (>>) (return ()) . reverse

sequence'''' :: [IO ()] -> IO ()
sequence'''' = foldl (\action acc -> acc >> action) (return ())
