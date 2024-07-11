--task 1
absInt :: Int -> Int 
absInt x = if x > 0
	       then x
	       else (-1)*x

--task2
min2Int :: (Int, Int) -> Int
min2Int (x, y) = if x > y
	             then y
	             else x

--task 3
min3Int :: (Int, Int, Int) -> Int
min3Int (x, y, z) = if (x < y && x < z)
	                then x
	                else if (y < x && y < z)
	                then y
	                else z

--task 4
min3Int2 :: (Int, Int, Int) -> Int
min3Int2 (x, y, z) = if (x == min2Int(x, y) && x == min2Int(x, z))
	                 then x
	                 else if (y == min2Int (x, y) && y == min2Int(y, z))
	                 then y
	                 else z

--task 5
toUpper :: Char -> Char
toUpper c = if fromEnum c >= 65 && fromEnum c <= 90 
            then c
            else if fromEnum c >= 97 && fromEnum c <=122 
			then toEnum(fromEnum c - 32)
			else '\0'

toLower :: Char -> Char
toLower c = if fromEnum c >= 97 && fromEnum c <= 122 
            then c
            else if fromEnum c >= 65 && fromEnum c <=90 
			then toEnum(fromEnum c + 32)
			else '\0'

--task 6
isDigit :: Char -> Bool
isDigit c = if fromEnum c > 47 && fromEnum c < 58
            then True
            else False

charToNum :: Char -> Int
charToNum c = if fromEnum c > 47 && fromEnum c < 58
	          then fromEnum c - 48
			  else -1

--task 7 
romanDigit :: Char -> String
romanDigit x = if x == '1'
               then "I"
			   else if x == '2' 
			   then "II"
               else if x == '3'
			   then "III"
               else if x == '4'
               then "IV"
               else if x == '5'
               then "V"
			   else if x == '6'
               then "VI"
               else if x == '7'
               then "VII"
               else if x == '8'
               then "VIII"
               else "IX"
