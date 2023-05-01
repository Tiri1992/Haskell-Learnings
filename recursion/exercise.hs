-- Counting bit sequences

sequenceCount :: Integer -> Integer -> Integer 
-- Base case
sequenceCount 0 _ = 1 
sequenceCount _ 0 = 1
sequenceCount n m = sequenceCount n (m - 1) + sequenceCount m (n - 1)

main = print (sequenceCount 1 2)
