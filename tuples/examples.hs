-- Examples of non-primitive types taking as arguments
-- Define tuples with their types (type1, type2)

twoNumbers :: (Double, Double)
twoNumbers = (3.14, 3.22)

randomTuple :: (String, Int, String, Int)
randomTuple = ("Hello", 2, "Bye", 3)

main = do 
    print twoNumbers
    print randomTuple