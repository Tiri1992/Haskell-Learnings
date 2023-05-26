
import Data.Char
-- Syntax to build lists: List comprehensions
-- It builds from set notation theory i.e. {x**2 | x in Natural numbers, x is even}
evenSquares :: [Integer]
evenSquares = [x^2 | x <- [1..], even x]

-- List comprehension is syntax sugar for applying a filter followed by a map like
evenSquaresAlt :: [Integer]
evenSquaresAlt = (map (^2) . filter even) [1..]


-- Behaves like a nested for loop in imperative programming langauges (i.e. for x, for y)
matchPairs :: [(Int, Char)]
matchPairs = [(x, y) | x <- [1..3], y <-"abc"]

-- We can put guards between the two generators, say if you wanted to filter the first generator before invoking the second
filterGenerator :: [(Integer, Integer)]
filterGenerator = [(x, y) | x <- [1, 7, 4], x > 5, y <- [x - 1..x + 1]]

divisors :: Integer -> [Integer]
divisors n = [k | k <- [1..n], k ^ 2 <= n ,n `mod` k == 0]

primes :: [Integer]
primes = [p | p <- [1..], length (divisors p) == 1]

clean :: String -> String
clean arr = [ toLower a | a <- arr, isLetter a, a /= ' ']

concatListComp :: [[a]] -> [a]
concatListComp xss = [x | xs <- xss, x <- xs]


main = do 
        print (take 5 evenSquares)
        print matchPairs
        print filterGenerator
        print (divisors 15)
        print (take 20 primes)
        print (clean "hEl6 3lo")
        print (concatListComp [[1, 2, 3], [4, 5], [6, 7]])