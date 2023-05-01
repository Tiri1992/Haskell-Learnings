-- Lambda expressions
-- We can define partials for our lambdas, but best to keep pattern variables for arguments
-- To define a lambda we use backslash `\`

applyTwice :: (Int -> Int) -> Int -> Int 
applyTwice f = f . f

-- Another usecase of lambdas is to write higher-order functions in the "function to function" view 
curryISC :: ((Int, String) -> Char) -> Int -> String -> Char 
curryISC f = \i s -> f (i, s)

flipISC :: (Int -> String -> Char) -> String -> Int -> Char
flipISC f = \s i -> f i s

main :: IO ()
main = do 
    print (applyTwice (\x -> x * 2) 8)
    print (applyTwice (\x -> x + 1) 7)