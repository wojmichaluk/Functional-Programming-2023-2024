--task 1
doEcho3 :: IO ()
doEcho3 = do
    l1 <- getLine
    l2 <- getLine
    putStrLn $ l1 ++ l2 

doDialog :: IO ()
doDialog = do
    putStr "What is your happy number? "
    line <- getLine
    let num = read line :: Int 
    if num == 7 
    then putStrLn "Ah, lucky 7!"
    else if odd num
        then putStrLn "Odd number! That's most people's choice..."
        else putStrLn "Hm, even number? Unusual!"

--task 2
doTwoQuestions :: IO ()
doTwoQuestions = do
    putStr "What is your name? "
    name <- getLine
    putStr "How old are you? "
    age <- getLine
    print(name,age)

twoQuestions :: IO ()
twoQuestions = putStr "What is your name? " >> getLine >>= \name -> putStr "How old are you? " >> getLine >>= \age -> print (name,age)  

--task 3
getLine' :: IO String
getLine' = do 
    c <- getChar
    if c == '\n' then return "" 
    else do 
        s <- getLine'
        return (c:s)
