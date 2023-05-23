-- How to write operators
-- Define a "string multiplication" operator and assign it to the chars "***"
-- e.g. "hello" *** 3 == "hellohellohello"

-- To define operators we need to write it as a binary function 
-- The type annotation needs to be written in its prefix form (with parenthesis) 
-- By prefix we mean <operator> <operand 1> <operand 2> so adding would be (+) 2 4 -> 6
(***) :: String -> Int -> String 
-- Similar to the applyUntil recursive function
-- We define a basecase against a wildcard
_ *** 0 = ""
s *** n = s ++ (s *** (n - 1))

-- Associations can be defined as 
-- infixl (left associative)
-- infixr (right associative)
-- infix (non associative)
-- 0-9 precedence level (9 being highest)


main = do 
    putStrLn ("hello" *** 2)
    putStrLn ("na" *** 8)
