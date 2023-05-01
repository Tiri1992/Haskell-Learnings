-- Higher order functions

applyTwice :: (Int -> Int) -> Int -> Int 
-- First argument is a function on integers (Int -> Int)
-- f is the function x is the arguement
applyTwice f x = f (f x)

double :: Int -> Int 
double x = 2 * x 

next :: Int -> Int 
next x = x + 1

applyTwiceTuple :: (Int -> Int) -> (Int -> Int)
-- This turns one integer function into another integer function. We use it like this with partial application
applyTwiceTuple f x = f (f x)

-- We use the applyTwiceTuple to convert the integer function double into quadruple
quadruple :: Int -> Int
quadruple = applyTwiceTuple double


-- Takes in a function having string, int as argument then returns a function taking in int, string as output
flipISC :: (Int -> String -> Char) -> (String -> Int -> Char)
flipISC f s i = f i s

-- Applying function composition: f * g
composition :: Int -> Int
composition = double . next 

-- We can now make use of applyTwice like this
main = do 
    print (applyTwice double 2)
    print (applyTwice next 1)
    print (quadruple 2)
    print (composition 4)

