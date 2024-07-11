--task 2
join :: Either e (Either e a) -> Either e a 
join (Left e) = Left e 
join (Right (Left e)) = Left e 
join (Right (Right a)) = Right a 

--task 3
safeDiv :: Int -> Int -> Either String Int 
safeDiv x y | y /= 0    = Right $ x `div` y
            | otherwise = Left "Cannot div by zero"

safeF5'' :: Int -> Int -> Int -> Either String Int 
safeF5'' x y z = f <$> iOverX <*> iOverY <*> iOverZ
    where
        f i j k = i + j + k
        iOverX = safeDiv 1000 x
        iOverY = safeDiv 100 y 
        iOverZ = safeDiv 10 z

--task 4
data ErrorTypes = IOError | DivByZeroError | WrongTypeError
--readFromFileAndDiv10 :: String -> Either ErrorTypes Int

--jeżeli jest błąd otwarcia pliku filename,
--to jest zwracany IOError 

--jeżeli w trakcie odczytywania danych z pliku
--nie będzie liczba, to zwracamy WrongTypeError

--jeżeli w trakcie odczytywania liczb z pliku 
--trafimy na 0, to jest zwracany DivByZeroError 
