-- Write a function intLength, should return the length of the given list of integeres
intLength :: [Int] -> Int
intLength [] = 0
intLength (x: xs) = 1 + intLength xs

polyLength :: [a] -> Int
polyLength [] = 0
polyLength (x:xs) = 1 + polyLength xs

-- List reconstruction
-- list of type a and a predicate of type (a -> Bool)
-- Walk through list up to the point the predicate is satisfied and returns up to the point its no longer satisified (not inclusive of this value)
takeAsLong :: [a] -> (a -> Bool) -> [a]
-- Basecase of empty list
takeAsLong [] _ = []
-- Build the list up with the colon operator : 
takeAsLong (x:xs) p | (p x == True) = x : (takeAsLong xs p)
                    | otherwise = []

naiveReverse :: [a] -> [a]
naiveReverse [] = []
naiveReverse (x:xs) = reverse xs ++ [x]

fastReverse :: [a] -> [a]
fastReverse xs = fastReverseAcc [] xs
-- helper func fastReverseAcc, as we traverse the list, we insert the head element into accumulator
    where fastReverseAcc acc []     = acc
          fastReverseAcc acc (x:xs) = fastReverseAcc (x:acc) xs


-- function that operates on a list of type [(String, Int)] containing words, counts 
-- Its output should be a list of words from the input with count of at least 5, only words returned not their count
-- frequentWordsOnly :: [(String, Int)] -> [String]
-- frequentWordsOnly [] = []
-- frequentWordsOnly (xs:xss) | snd xs > 5 = fst xs : frequentWordsOnly xss
--                            | otherwise    = frequentWordsOnly xss


frequentWordsOnly :: [(String, Int)] -> [String]
frequentWordsOnly tup =
    let cleaned = filter ((> 4).snd) tup
    in map (fst) cleaned

-- Solution: Cleaner one line instead of using the two lines from `let` keyword
frequentWordsAns :: [(String, Int)] -> [String]
frequentWordsAns = map fst . filter (\x -> snd x >= 5)


-- frequentWordsOnlyFilter x = filter snd x > 5

-- Implement maxInt which returns the max integer from a list of integers 
-- Use foldr1 so the first value selected from the list is your basecase
maxInt :: [Int] -> Int 
maxInt xs = foldr1 max xs

main = do
    print (intLength [4, 5, 6])
    print (polyLength ["hi", "bye"])
    print (takeAsLong [] (>2))
    print (naiveReverse "castle")
    print (frequentWordsOnly [("hello", 6), ("bye", 2), ("james", 8)])