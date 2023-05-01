isTriangleTuple :: (Double, Double, Double) -> Bool 
isTriangleTuple (a, b, c) = a + b + c == 180

-- We can transform functions between curried and uncurried form
-- Using curry and uncurry higher order funcs from the prelude lib


-- Currying functions with more arguments
isTriangle :: Double -> Double -> Double -> Bool 
isTriangle alpha beta gamma = alpha + beta + gamma == 180 

-- We can use a partial application with one or two arguments
mustBeSixty :: Double -> Bool
mustBeSixty = isTriangle 100 20

mustBeThirty :: Double -> Bool
mustBeThirty = isTriangle 100 50

main = print (isTriangle 90 50 50)
