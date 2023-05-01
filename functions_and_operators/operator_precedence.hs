-- Associations can be defined as 
-- infixl (left associative)
-- infixr (right associative)
-- infix (non associative)
-- 0-9 precedence level (9 being highest)

-- Makes logical sense to have *** left associative as the result should be a string 
-- "hi" *** 2 *** 3 is equivalent to ("hi" *** 2) *** 3
-- Also need to have the exp "a" *** 4 == "aaaa" without bracketing, hence pick precedence level 5
-- == is predecence level 4, so we need to pick one above

infixl 5 ***
(***) :: String -> Int -> String 
_ *** 0 = ""
s *** n = s ++ (s *** (n - 1))

main = do 
    print ("a" *** 4 == "aaaa")
    print ("ab" *** 2 == "abab")
    print ("ab" *** 2 *** 3)