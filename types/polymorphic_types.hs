-- Creating Polymorphic Types
-- Maybe type: Similar to Optional[] type in python
-- A polymorphic type is a type which contains one or more type variables 
-- Maybe type represents computations that can fail. If we can recover for runtime errors it would be better to return an optional value using maybe
-- and then handle the error instead of crashing the program

-- Example: head will crash on an empty list, but using Maybe we can write a polymorphic, safe version of head 
safeHead :: [a] -> Maybe a 
safeHead [] = Nothing 
safeHead (x: _) = Just x 


-- Now any code using the safeHead can then handle the error case by pattern matching on the returned Maybe value 

showHead :: (Show a) => [a] -> String 
showHead xs = case safeHead xs of 
                Nothing -> "Empty list!"
                Just x -> show x


-- Constructors as polymorphic functions 
-- data constructors can be treated as functions:: i.e. data constructors can be polymorphich functions 
-- Just :: a -> Maybe a

safeLast :: [a] -> Maybe a
safeLast [] = Nothing 
safeLast xs = Just (last xs)

-- Error messages with Either
-- Polymorphic types as well and contains two type variables
-- Holds either type a or b: left values contains why the computation has failed, right constructor contains successful results
-- data Either a b = Left a | Right b 

-- Example: Lets rewrite Fraction type, left representing a string of why its failed (like division by zero) and right representing result
newtype Fraction = Fraction (Int, Int) deriving (Show)

makeFraction :: (Int, Int) -> Either String Fraction
makeFraction (_, 0) = Left "Denominator cannot be 0"
makeFraction (x, y) | y < 0 = Left "Denominator cannot be negative"
                    | otherwise = Right (Fraction (x, y))

main = do 
    let empty = [] :: [Int]
    putStrLn (showHead [1..5])
    putStrLn (showHead empty)
    print (safeLast [1..4])
    print (safeLast empty)
    print (safeHead [1..3])
    print (makeFraction (1, 0))
    print (makeFraction (3, 2))
