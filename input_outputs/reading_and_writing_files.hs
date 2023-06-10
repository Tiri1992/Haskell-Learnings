-- Reading and writing files

-- We can read and write files as strings
readFile :: String -> IO String 
writeFile :: String -> String -> IO ()

-- Heres a function which copies a file
-- We read and then write to a different location, keeping the data intact
copy :: String -> String -> IO()
copy source dest = readFile source >>= writeFile dest


-- Only at the beginning and end of program do we need IO bound functions
-- Middle step should include pure functions
-- Here is an example program that reads two numbers and returns the GCD and LCM

gcd :: Integer -> Integer -> Integer
gcd a b | a < b = gcd b a
gcd a 0 = a
gcd a b = gcd b (a `mod` b)

lcm :: Integer -> Integer -> Integer
lcm a b = (a * b) `div` (gcd a b)

readInput :: IO (Integer, Integer)
readInput = readLn >>= \a -> readLn >>= \b -> pure (a, b)

printOutput :: Integer -> Integer -> IO ()
printOutput g l = print g >> print l