--task 1
sgn :: Int -> Int
sgn x | x > 0 = 1
      | x == 0 = 0
      | otherwise = -1

min3Int :: (Int, Int, Int) -> Int
min3Int (x, y, z) | x<=y && x<=z = x
                  | y<=x && y<=z = y
                  | otherwise = z

--task 2
toUpper :: Char -> Char
toUpper c | fromEnum c >= 65 && fromEnum c <= 90 = c
          | fromEnum c >= 97 && fromEnum c <= 122 = toEnum(fromEnum c - 32)

toLower :: Char -> Char
toLower c | fromEnum c >= 97 && fromEnum c <= 122 = c
          | fromEnum c >= 65 && fromEnum c <= 90 = toEnum(fromEnum c + 32)

isDigit :: Char -> Bool
isDigit c | fromEnum c > 47 && fromEnum c < 58 = True
          | otherwise =  False

charToNum :: Char -> Int
charToNum c | fromEnum c > 47 && fromEnum c < 58 = fromEnum c - 48

romanDigit :: Char -> String
romanDigit x | x == '1' = "I"
	       | x == '2' = "II" 
	       | x == '3' = "III"
	       | x == '4' = "IV"
	       | x == '5' = "V"
	       | x == '6' = "VI"
	       | x == '7' = "VII"
	       | x == '8' = "VIII"
	       | otherwise = "IX"

