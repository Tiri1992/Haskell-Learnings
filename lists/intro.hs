-- Introduction to Lists
-- Denoting lists in square brackets with their type

ints :: [Int]
ints = [1, 2, 3]

empty :: [Int]
empty = []

-- Functions can also be types of elements inside a list
functions :: [Int -> Int]
functions = [(+1), (*2)]

-- Nested list of lists of strings
nested :: [[String]]
nested = [["This", "is", "nested"], ["List", "of", "strings"]]

-- : is right associative, this is equivalent to [1, 2, 3]
simple :: [Int]
simple = 1 : 2 : 3 : []

-- Applying a predicate `test` function against all elements `xs` of a list
-- ContainsMatchingInt should return true if elements satisifies the predicate `test` otherwrise False
-- If `x` is the current element, `xs` is a reference to the next element. Think of a linked list structure
containsMatchingInt :: (Int -> Bool) -> [Int] -> Bool 
-- Basecase when empty list left means not found
containsMatchingInt _ [] = False 
-- Terminate if found
containsMatchingInt test (x:xs) | test x         = True 
                                | otherwise      = containsMatchingInt test xs 
                                

-- We need to use parentheses around the cons pattern on the left hand side
main = do 
    print (containsMatchingInt (>3) [2, 3, 4])
    print (containsMatchingInt (\x -> x `mod` 3 == 0) [1, 2])