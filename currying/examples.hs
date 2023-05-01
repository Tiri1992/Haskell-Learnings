-- Writing funcs with multiple args
dividesTuple :: (Int, Int) -> Bool 
dividesTuple (a, b) = mod b a == 0


-- There is another way to write functions with multiple arguments called currying
-- Its read in the type annotation dividesCurry :: Int -> (Int -> Bool) 
-- Which tells us dividesCurry is a higher order function. A func that takes one Int argument and returns
-- A function from Int to Bool
dividesCurry :: Int -> Int -> Bool 
dividesCurry a b = mod b a == 0

-- We can call a partial function on dividesCurry and make a partial application from it
divideBy3 :: Int -> Bool
divideBy3 = dividesCurry 3

-- Note: Function application, contrary to the function type arrow associates to the left
-- hence dividesCurry 3 4 is the same as (dividesCurry 3) 4
-- This means when we are applied dividesCurry to two arguments, we are first applying dividesCurry to 
-- One argument (3) and then yielding an intermediate function of type Int -> Bool. This function behaves
-- like the divideBy3. Hence this is why we can apply the divideBy3 to the second argument (6) below.

main = print (divideBy3 6)