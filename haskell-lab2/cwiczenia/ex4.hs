isPalindrome :: [Char] -> Bool
isPalindrome s = if s == reverse s
                 then True
                 else False  
