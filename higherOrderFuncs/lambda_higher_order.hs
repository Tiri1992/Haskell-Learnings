import Data.Char
-- Lambda expressions in higher-order functions
-- Common pattern for higher order functions
-- Define general logical patterns using abstract higher order functions
-- Instantiate concrete functions by supplying simple functions as arguments to the higher-order funcs
-- Applys f to x repeadly. Stops when p(x) is True. We define a stopping condition on p 
applyUntil :: (Int -> Bool) -> (Int -> Int) -> Int -> Int
applyUntil p f x | p x == True = x 
                 | otherwise = applyUntil p f (f x)

-- Using the apply until pattern for computing the greatest odd divisor of a number
-- Stopping condition is defined by mod 2 resulting in 1 (i.e. odd value), else we divide by 2
greatestOddDivisor :: Int -> Int 
greatestOddDivisor = applyUntil (\x -> mod x 2 == 1) (\x -> div x 2)

-- Finding smallest natural number that matches a given property
-- Pattern variable p still has to be defined
-- The function `f` increases x from 1 indefinitely (this is an infinite recursion until p (x) gives True)
smallestNatThat :: (Int -> Bool) -> Int 
smallestNatThat p = applyUntil p (\x -> x + 1) 1 

main = print (smallestNatThat (\x -> isLetter (chr x)))
