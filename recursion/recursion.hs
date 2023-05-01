-- We use recursion to tackle issues solved with loops in imperative languages 
compoundInterest :: Int -> Double 
-- defined base case
-- Bug, becomes a partial function as it can match any integer value including negatives (leading to an infinite loop)
compoundInterest 0 = 1000 
compoundInterest n = 1.05 * compoundInterest (n - 1)

compoundInterestFixed :: Int -> Double 
-- This works, but its more efficient to define a data type where we declare some Int > 0
compoundInterestFixed n | n <= 0 = 1000
                        | otherwise = 1.05 * compoundInterestFixed (n - 1)

-- Factorial
-- Expressions to compute smaller factorials are sub expressions of those for larger factorials
factorial :: Int -> Int 
-- Define base case
factorial 1 = 1
factorial n = n * factorial (n - 1)

rangeSum :: Int -> Int -> Int 
rangeSum a b | a > b = 0
             | otherwise = a + rangeSum (a + 1) b

rangeSumDeduction :: Int -> Int -> Int 
-- Opposite direction
-- Need to use guards to split the logic
rangeSumDeduction a b | a > b = 0
                      | otherwise = b + rangeSumDeduction a (b - 1)



sayAgain :: String -> Int -> String 
-- Base case is emptry string, then recursively traverse
sayAgain s i | i == 0 = "" 
             | otherwise = s ++ sayAgain s (i - 1)

-- Alternative: Not using guards
sayAgainAlt :: String -> Int -> String 
sayAgainAlt _ 0 = ""
sayAgainAlt word times = word ++ sayAgainAlt word (times - 1)





main = print (sayAgain "hello" 3) 