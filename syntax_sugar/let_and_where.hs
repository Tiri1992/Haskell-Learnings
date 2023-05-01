solveQuadratic :: Double -> Double -> (Double, Double)
solveQuadratic p q = (-p/2 - sqrt ((p/2)^2 - q), -p/2 + sqrt ((p/2)^2 - q))

-- We can redefine the above into subexpressions using let bindings
solveQuadraticSimple :: Double -> Double -> (Double, Double)
-- Assign the pattern variable on the left, to the expression on the right
solveQuadraticSimple p q = let 
                                p' = -p/2
                                d = sqrt (p'^2 - q)
                            in (p' - d, p' + d)

numberOfSolutions :: Double -> Double -> Int 
numberOfSolutions p q = let 
                            (a, b) = solveQuadraticSimple p q 
                        in if a == b then 1 else 2

solveQuadraticWhere :: Double -> Double -> (Double, Double)
solveQuadraticWhere p q = (p' - d, p' + d)
    where p' = -p/ 2
          d = sqrt (p'^2 - q)

-- Where bindings are very useful for defining helper functions
-- Refactoring the fibonacci function, with a fibHelper defined in the where block to reduce boilerplate code

fibonacci :: Int -> Int 
fibonacci 0 = 0
fibonacci n = fibHelper 0 1 (n - 1)
    where fibHelper :: Int -> Int -> Int -> Int 
          fibHelper smaller larger 0 = larger 
          fibHelper smaller larger steps = fibHelper larger (smaller + larger) (steps - 1)


-- Exercise: Write a func divisors :: Int -> Int, inputs integer n and output the count of positive integers that divides n 
divisors :: Int -> Int 
divisors 0 = 0 
divisors n = divHelper 1 n 
    where divHelper :: Int -> Int -> Int 
            -- Terminate when the denominator (a) is bigger than the numerator (b)
          divHelper a b | a > b = 0
                        | b `mod` a == 0 = 1 + divHelper (a + 1) b
                        | otherwise = divHelper (a + 1) b
    
main = print (divisors 19)