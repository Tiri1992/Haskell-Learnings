-- We can use the syntax sugar of if-else instead of guards
factorial :: Int -> Int 
factorial n = if n == 1 then 1
            else n * factorial (n - 1)

-- Case expressions
-- Same as defining several equations for a function
both :: Bool -> Bool -> Bool 
both x y = case (x, y) of  
            (True, True) -> True 
            -- Wilcard _ matches all other cases
            _ -> False

main = do 
        print (factorial 4)
        print (both True False)