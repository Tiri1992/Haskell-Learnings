import Distribution.SPDX (LicenseExceptionId(Swift_exception))
-- Creating custom data types

-- Use the data keyword to create custom types
-- Our type is called Geometry and data constructors: Rectangle, Square, Circle
data Geometry = Rectangle Double Double | Square Double | Circle Double deriving (Show)

-- We can create Geometry values for the constructors
s1 :: Geometry
s1 = Rectangle 4 5 :: Geometry 

-- Depending what type of constructor is passed, different executions occur
-- I.e. we've defined different patterns for our data declaration
perimeter :: Geometry -> Double
perimeter (Rectangle width height) = 2 * width + 2 * height
perimeter (Square width) = width * 4
perimeter (Circle radius) = 2 * pi * radius

-- Showing Geometry values
-- Examples of functions which deconstruct and later reconstruct shapes to enlarge them
-- We needed to add a 'deriving (Show)' to our constructors so that we can automatically generate a show function for our custom data types

enlarge :: Geometry -> Double -> Geometry
enlarge (Rectangle a b) n = Rectangle (a * n) (b * n)
enlarge (Square a) n = Square (a * n)
enlarge (Circle r) n = Circle (r * n)

-- We could have alternatively mapped the output to a Double and used the perimeter function in the equation to return the right type
-- that will print to screen
enlargeWithPerimeter :: Geometry -> Double -> Double
enlargeWithPerimeter (Rectangle a b) n = perimeter (Rectangle (a * n ) (b * n))
enlargeWithPerimeter (Square a) n = perimeter (Square (a * n))
enlargeWithPerimeter (Circle r) n = perimeter (Circle (r * n))

-- Constructors are like functions
-- Rectangle and Square are functions that take Double values are return Geometry values 
-- Means when we call Square 4.0 we are yielding Geometry types 
-- We can also pass them in as arguments to higher order functions
mappingSquares :: [Geometry]
mappingSquares = map Square [1, 2, 3]

-- Enums: Types defined by data can work like enums in other languages

data Animal = Cat 
    | Dog
    | Mouse
    | Elephant


main = do 
        print (perimeter (Rectangle 4 3))
        print (perimeter (Circle 2))
        print (enlarge (Rectangle 2 2) 2)
        print mappingSquares