-- We can chain IO actions with `do` keyword

-- Split several io bound funcs using do notation
addInput :: IO()
addInput = do
        putStrLn "Whats your first number?"
        -- Bind output to a variable using <- i.e (first <- getLine)
        first <- readLn
        putStrLn "Whats you second number?"
        second <- readLn
        putStrLn ("This sum is " ++ show (first + second) ++ ".")

-- In a do-block, every line must be of type IO a, in this case we can use
-- x <- action
-- And variable x will be of type a
-- The last action in a do block may not bind variables with <-. This would not make sense, as the bound variable cannot be used in later actions of the block.
-- The whole `do` block is an expression, where the last bit must output some result. This is an IO bound operation after all.

-- Combining the previous example using the <- assignment. It reads two integer inputs and prints them to screen
readInput :: IO (Integer, Integer)
readInput = do 
        first_number <- readLn
        second_number <- readLn 
        pure (first_number, second_number)

-- The do notation also allows us to separate our pure functions from the IO bound functions using the `let` keyword
-- let pattern = expression
-- In contrast to the previously defined `let` bindings in expressions, we do not need to end the line with `in` here.
addInputPure :: IO()
addInputPure = do 
        putStrLn "Whats your first number?"
        first <- readLn 
        putStrLn "Whats your second number?"
        second <- readLn 
        -- Separating the pure part of our code using `let`
        let total = first + second 
        let output = "The total sum is " ++ show total ++ "."
        putStrLn output

guessingGame :: Int -> IO ()
guessingGame solution = do 
        putStrLn "Guess the number!"
        guess <- readLn 
        let output = if guess == solution then "Correct!" else "Wrong!"
        putStrLn output