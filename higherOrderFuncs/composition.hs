-- Using the composition operator * 
-- Read as: Take in some function which maps from Int -> Int. Returns another func which maps Int -> Int
applyTwice :: (Int -> Int) -> Int -> Int 
applyTwice f = f . f 

double :: Int -> Int 
double n = 2 * n 

quadruple :: Int -> Int
quadruple = applyTwice double 

applyTimes :: (Int -> Int) -> Int -> (Int -> Int)
-- Base case 
applyTimes f 1 = f 
applyTimes f n = f . applyTimes f (n - 1)


doubleThreeTimes :: Int -> Int
doubleThreeTimes = applyTimes double 3


main = print (doubleThreeTimes 2)