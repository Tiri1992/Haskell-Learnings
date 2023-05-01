-- Operators and function names
-- A function whose name consists only of punctuation chars (like +*-/$%) is an operator
-- A function whose name consists only of letters and digits is an ordinary function

-- Operators can only take two arguments (i.e. 4 + 2) while functions can take arbitary number of args
-- Partially applying operators
timesTwo :: Int -> Int
timesTwo = (*) 2

equalToC :: Char -> Bool
equalToC = (==) 'c'

-- Theres handy special notation for partially applying operators
timesTwoFancy :: Int -> Int
timesTwoFancy = (2*)

equalToCFancy :: Char -> Bool
equalToCFancy = ('c' ==)

-- Partially apply the operator with the second argument
divideByThree :: Double -> Double
divideByThree = (/3)

-- This such partial application of an operator is called a "Section" of the operator
-- This section notion is useful when using operators in higher order functions as it shortens the lambda expressions like \x -> x / 3

-- Lets reconsider the previous applyUntil function
applyUntil :: (Int -> Bool) -> (Int -> Int) -> Int -> Int
-- p x is equivalent to p x == True
applyUntil p f x | p x = x
                 | otherwise = applyUntil p f (f x)
        
-- Validation for termination is p i.e. a lambda expression /x -> x > 1000
-- We simplify the operation by doing a "section" of the operator here i.e. > 1000
main = print (applyUntil (> 1000) (*2) 1)