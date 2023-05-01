-- Write an ifThenElse which takes a triple of Boolean and two ints
-- If boolean is true then return first int else return second int 
ifThenElse :: (Bool, Int, Int) -> Int 
ifThenElse (True, a, b) = a
ifThenElse (_, a, b) = b

main = print (ifThenElse (False, 2, 4))

