-- Consider the function
inRangeTuple :: (Int, Int, Int) -> Bool
inRangeTuple (lower, upper, query) = lower <= query && query <= upper


inRange :: Int -> Int -> Int -> Bool
inRange lower upper query = lower <= query && query <= upper

betweenTenAndTwenty :: Int -> Bool
betweenTenAndTwenty = inRange 10 20

main = print (betweenTenAndTwenty 13)

