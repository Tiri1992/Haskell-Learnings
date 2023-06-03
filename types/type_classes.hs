-- A type class is a collection of types that share a common property
-- The type class Show is the class of all types, that can be turned into a string using the show function 

-- class Show a where 
--     show :: a -> String 

-- Deriving type classes
-- The way type class instances are derives is by adding a `deriving` keyword at the end of our data declarations
data Coordinates = Coordinates Double Double deriving (Show)

-- How does the compiler automatically create a show instance for a type with an inferred Show implementation. 
-- In general, the derived show implementation prints types the same way they are constructed i.e. constructs for Coordinates will print values like "Coorinates 3 4"

-- Customising type classes

-- Sometimes we wont want the default Show instance derived from the compiler. E.g. we might want "(3, 4)" instead of "Coordinates 3 4"

data CoordinatesCustom = CoordinatesCustom Double Double

-- Here we define an instance declaration specifically for show that derived from the CoordinatesCustom type 
instance Show CoordinatesCustom where 
    show :: CoordinatesCustom -> String
    show (CoordinatesCustom x y) = show (x, y)

-- Type class constraints
-- When writing polymorphic functions, we can limiit the range of types for type variables by adding type class constraints 

--showHead = show . head 


-- We want showHead to be polymorphic, but it can only be applied to lists with elements that support the Show element (i.e. we are adding a constraint to the type variables)
-- To add a type class constraint to its type declaration 

-- The "=>" is a class constraint. Its read as 
-- For each type "a" in the type class Show there is a showHead function of type [a] -> String 
showHead :: (Show a) => [a] -> String 
showHead = show .head 

-- Comparing for equality with Eq
-- data Eq a where 
--     (==), (/=) :: a -> a -> Bool 
--     x /= y not (x == y)

-- Eq instances can be derived. The default implementation first compares the constructors and then recursively compares the values inside them
-- Extending our Geometry data type 
data Geometry = Rectangle Double Double | Square Double | Circle Double deriving (Show, Eq, Ord)

main = do 
        print (showHead [True, False, True])
        -- Comparing different constructors will never be equal
        print (Rectangle 2 3 == Circle 4)
        print (Rectangle 2 3 == Rectangle 3 2)
        -- But when the constructors are equal, we look at the arguements
        print (Rectangle 2 3 == Rectangle 2 3)
        -- Avoid deriving Ord for custom types, here it shows Rectangle is always smaller than square because it will derive order by the order in which we've defined our Geometry constructors 
        print (Rectangle 3 4 < Square 3)