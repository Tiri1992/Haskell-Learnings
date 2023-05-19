-- Folds or reduce is a higher order operation that reduces lists to a single value

sum1 :: [Int] -> Int
sum1 [] = 0
sum1 (x:xs) = x + sum1 xs


-- concat = foldr (++) []

-- Any function can take a list of bools and return if any elements are true
-- any :: [Bool] -> Bool 
-- any = foldr (||) False 

all :: [Bool] -> Bool
all = foldr (&&) True

product :: [Integer] -> Integer
product xs = foldr (*) 1 xs

equalsNew :: Eq a => a -> [a] -> [Bool]
equalsNew x = map (==x)

-- Redundant map when using . (==x) will map against list and operate the equals check
elemNew :: Eq a => a -> [a] -> Bool
elemNew x = any ((True==) . (==x))


-- Map and filter are folds!
-- Initial value of the accumulator is the empty list, on each element as we traverse through list, we apply f (a -> b) 
mapAsFold :: (a -> b) -> [a] -> [b]
mapAsFold f = foldr (\x xs -> f x : xs) []

-- if we want to continue with the list we reference x:xs, else xs is the next element in list
filterAsFold :: (a -> Bool) -> [a] -> [a]
filterAsFold p = foldr (\x xs -> if p x then x:xs else xs) []

-- foldr = right fold, foldl = left fold
-- When your operator is associative, left and right folds are equivalent 
-- When they are not, as in the case of mapping, we see different results
mapAsLeftFold :: (a -> b) -> [a] -> [b]
mapAsLeftFold f = foldl (\xs x -> f x: xs) []

-- We can have some nice applications using the foldl, an example if reversing a string (which is just a character array)
foldReverse :: [a] -> [a]
-- foldl is missing the last argumenet it takes which is a list. This missing input is now the input of foldReverse defined as [a]
foldReverse = foldl (flip (:)) []

-- Folds with implicit base value
-- Some applications of folds where the folding function is a binary operator (i.e. +, - etc) 
-- In these cases, a meaningful base value can simply be the first or last value of the input list itself
-- We can do this with foldr1 or foldl1 dependeing if you want to use the first value on a right or left fold
newSum :: [Int] -> Int
newSum = foldr1 (+)


main = do 
        print (filterAsFold (>2) [0,1,2,3])
        print (mapAsLeftFold (*2) [2,3,4])
        print (foldReverse [1,2,3])
        print (foldReverse "hello") 


-- UP TO Viewing foldr as replacing constructors