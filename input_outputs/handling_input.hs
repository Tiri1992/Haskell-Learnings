-- Handling input
-- The input equivalent to putStrLn is getLine :: IO String 
-- It is an IO action that reads a line of input and yields a string 
-- >> ignores the value produced by the first IO action so we need to use the bind operator >>=

echo :: IO ()
echo = getLine >>= \s -> putStrLn s 