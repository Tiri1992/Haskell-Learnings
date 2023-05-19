-- Word frequency count
import Data.Char ( isLetter, toLower )
import Data.List ( sort, group ) 


-- No recursion, but using the filter and map function
wordFrequencies :: String -> [(String, Int)]
wordFrequencies s = 
    let cleaned = (filter (\x -> isLetter x || x == ' ') . map toLower) s  
        groupedWords = (group . sort . words) cleaned 
    in map (\xs -> (head xs, length xs)) groupedWords

main = print (wordFrequencies "It was the best of times, it was the worst of times,")