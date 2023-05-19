-- Applying funcs on lists to reduce to a single value is called a fold
append :: [a] -> [a] -> [a]
-- First list is empty return list of appended on the right
append [] ys = ys 
-- When first list is non empty, take the head of left list and recursively traverse the tail of the left list until its exhausted
-- Then append all of the right list to the end
append (x:xs) ys = x : (append xs ys)


everySecondElem :: [a] -> [a]
everySecondElem [] = []
everySecondElem [x] = []
everySecondElem (x:y:xs) = y:(everySecondElem xs)


main = print (everySecondElem [1,2,3,4])