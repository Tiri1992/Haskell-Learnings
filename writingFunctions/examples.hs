-- Concatenates two strings with itself
sayTwice :: String -> String 
sayTwice s = s ++ s

-- Pattern variables are how we define our formular of our function
-- And this is what our argument values are bound to
-- Output of cube is the right sided expression which is n * n * n

cube :: Int -> Int 
cube n = n * n * n 

-- We can define the types of our inputs and outputs more strictly rather than the
-- Interpretor infering them
percentage :: Double -> Int 
percentage d = round (100 * d)

main = print (percentage 0.85)