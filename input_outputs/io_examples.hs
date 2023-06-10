-- Intro to IO
-- Most of the code we've discussed has been pure functional code i.e. with no side effects. 
-- This isn't suitable for IO operations 
-- Every function that handles IO must have IO as a return type

-- main is only executed for its side effects and not used to produce further values for the program
-- main :: IO()
-- main = putStrLn "Hello, World!"

-- Chaining IO actions
-- >> can be used to chain two IO bound operations, the result is produced one after the other
printTwoLines :: String -> String -> IO ()
printTwoLines s t = putStrLn s >> putStrLn t

-- Extend this to a recursive function that takes a list of strings and prints each of them on its own line
printLines :: [String] -> IO()
-- In the event list is empty we want to print nothing. This is what `pure` function is
printLines [] = pure ()
printLines (x:xs) = putStrLn x >> printLines xs

main :: IO ()
main = do 
        printTwoLines "first" "second"
        printLines ["hello", "there"]
