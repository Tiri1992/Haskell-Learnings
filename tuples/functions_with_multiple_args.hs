-- Tuples as args
-- Binds its values to the pattern variables a & b
perimeter :: (Double, Double) -> Double 
perimeter (a, b) = 2 * a + 2 * b 

-- Binding literal patterns or wilcard patterns inside tuple params. Here we check if both args are true
bothTrue :: (Bool, Bool) -> Bool
bothTrue (True, True) = True 
bothTrue (_, _) = False 


-- Patterns must be linear, each pattern variable must occur only once in each pattern
-- isSquare :: (Double, Double) -> Bool 
-- isSquare (a, a) = True 
-- isSquare (_, _) = False

-- Not allows as we use the same pattern variable twice (here using 'a')
-- We can use guarded equations to write these checks
isSquare :: (Double, Double) -> Bool 
isSquare (a, b) | a == b = True 
                | otherwise = False

-- Tuples as results 
area :: (Double, Double) -> Double
area (a, b) = a * b 

areaAndPerimeter :: (Double, Double) -> (Double, Double)
areaAndPerimeter (a, b) = (area (a, b), perimeter (a, b))

-- We can write this more cleanly than having to rewrite a, b pattern variables explicitly using a single pattern variable

areaAndPerimeterClean :: (Double, Double) -> (Double, Double)
areaAndPerimeterClean tup = (area tup, perimeter tup)

main = do
        print (bothTrue (True, False))
        print (perimeter (2.0, 3.0))
        -- `fst` gets the first element, `snd` gets the second element
        print (fst (areaAndPerimeter (2, 3)))
        print (snd (areaAndPerimeter (2, 3)))