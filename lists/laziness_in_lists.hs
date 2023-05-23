-- Lazy evaluation in lists
-- Def: Func args are only evaluated if its necessary to determine whether the pattern of an equation matches.
-- Consider chain of neste function calls like
someCall :: (a1 -> a2) -> [a1] -> a2
someCall f xs = head (map f xs)

-- We only evaluate the inner function map if its necessary to evaluate `head`. In this case we just need to determine if the list is empty or not. 
-- Reduces the operation of someCall from O(N) to O(1)
-- This lazy evaluation on lists allows us to create functions that operate on lists of infinite size

-- Try construct an infinite list like [n..], we can do this by writing recursive list with no base case, i.e. it will keep adding forever 
startFrom :: Int -> [Int]
startFrom n = n : startFrom (n + 1)

-- We can make use of map and filter with infinite lists as well 
takeFirstNevenFilter :: Int -> [Int]
takeFirstNevenFilter n = take n (filter even [1..])

-- Taking first N repeated
firstNrepeatedFives :: Num a => Int -> [a]
firstNrepeatedFives n = take n (repeat 5)

-- Powerful function is iterate f z that applies the function f(z) over and over, yielding the value of each iteration 
powersOfN :: Int -> [Int]
powersOfN n = iterate (*2) n


nPowersOfTwo :: Int -> [Int]
nPowersOfTwo n = take n (powersOfN 2)

-- Implement the iterate func, which applies f(z) over and over, yielding elements into an infinite list 
iterate1 :: (a -> a) -> a -> [a]
iterate1 f z = z : iterate1 f (f z)