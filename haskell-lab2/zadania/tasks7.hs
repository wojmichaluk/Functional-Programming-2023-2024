--task 1
prod'2 :: Num a => [a] -> a
prod'2 = loop 1
    where loop pr [] = pr
          loop pr (x:xs) = loop (pr * x) xs

length'2 :: [a] -> Int 
length'2 = loop 0
    where loop len [] = len
          loop len (x:xs) = loop (len + 1) xs

--task2
--Coś koło 12,7 miliona 

--task3 - w pliku ex6.hs

--task4
--dla N=1_000_000
--sum' 0,65s; sum'3 1,58s; sum'4 1,41s
--dla N=5_000_000
--5,94s / 4,65s / 2,18s
--dla N=8_000_000
--7,23s / 9,06s / 3,87s
