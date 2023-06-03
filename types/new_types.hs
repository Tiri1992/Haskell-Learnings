-- Type synonyms
-- data Coordinates = Coordinates Double Double

-- Instead we can be more expressive for simple types i.e. a data type of two Doubles
-- This is called a type synonym and does not create a new type, instead introduces a new name for existing type (Double, Double)
-- We don't need to worry about adding the `deriving` keyword for type classes like Show, Ord, Eq etc
-- Much more expressive and readble type annotations
type Coordinates = (Double, Double)

-- Now we can use this new alias type 
distance :: Coordinates -> Coordinates -> Double 
distance (x1, y1) (x2, y2) = sqrt ((x1 - x2)^2) + ((y1 - y2)^2)


-- Other type synonyms are used as comments to make type annotation more readable and expressive (for docstring equivalent? Clean code)
-- type Word = String 
-- type Sentence = [Word]
-- type Paragraph = [Sentence]

-- tokenize :: Word -> [Paragraph]
-- join :: [Paragraph] -> Paragraph

-- Some drawbacks is we don't get as many detailed check at compile time 
-- I.e. if we defined two type synonyms as strings and a function that concatenates the two in particular order, we could theoretically parse them in any order
-- and the compiler wouldn't complain

-- NewType Wrappers
-- Conceptually, newtypes sit between type synonms and data types
newtype IP = IP String 
newtype Path = Path String 
newtype URL = URL String 

-- We can also use newtype to redefine an existing type or remove an exisiting type from its type class instantiations
newtype Fraction = Fraction (Int, Int)

-- We can now redefine the eq instance type for Fraction
instance Eq Fraction where
    Fraction (a, b) == Fraction (c, d) = a * d == c * b 

main = do
    print (Fraction (1, 2) == Fraction (2, 4))