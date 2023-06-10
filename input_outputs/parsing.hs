-- Parsing strings into different types and back

-- Heres a function that reads a number and doubles it
ioDouble :: IO()
ioDouble = getLine >>= \s -> putStrLn ((show . (*2) . read) s)

-- Two utility functions that help simplify the above
-- readLn combines getLine and read
-- print combines show and putStrLn