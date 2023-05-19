-- Functions of lists: Map and filter
import Data.Char

roundList :: [Double] -> [Int]
roundList [] = []
roundList (x:xs) = round x : roundList xs 

lowerString :: [Char] -> [Char]
lowerString [] = []
lowerString (x:xs) = toLower x : lowerString xs 

-- Using map from prelude to apply a function against elements in a list 
roundListMap :: [Double] -> [Integer]
roundListMap = map round 

lowerStringMap :: [Char] -> [Char]
lowerStringMap = map toLower

-- Filter
-- Traversing a list and removing elements that do not satisfy a given condition
removePunctuation :: [Char] -> [Char]
removePunctuation [] = []
removePunctuation (x:xs) | not (isPunctuation x) = x : removePunctuation xs 
                         | otherwise             = removePunctuation xs 
                        

removeEmpty :: [[a]] -> [[a]]
-- Base case is when the list contains no other lists
removeEmpty [] = []
-- Check that a list is empty
removeEmpty (xs:xss) | length xs > 0 = xs : removeEmpty xss 
                     | otherwise     = removeEmpty xss 

-- Using the builtin filter method our above function becomes
removePunctuationFilter :: [Char] -> [Char]
removePunctuationFilter = filter (not . isPunctuation)

removeEmptyFilter :: [[a]] -> [[a]]
removeEmptyFilter = filter (\a -> length a > 0)





main = do 
        print (lowerString "HELLO, HOW ARE YOU?")
        print (removePunctuation "he.!o")
        print (removeEmpty [["hello"], [], ["bye"]])