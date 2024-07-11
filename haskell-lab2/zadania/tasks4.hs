import Data.Char (toUpper)

--task 1 - w pliku ex4.hs

--task 2
getElemAtIdx t i = el
    where s = drop i t
          el = head s

--task 3
capitalize :: [Char] -> [Char]
capitalize w = [toUpper(head w)] ++ tail w
