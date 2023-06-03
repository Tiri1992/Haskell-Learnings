-- Defining nested types

data Geometry = Rectangle Double Double | Square Double | Circle Double deriving (Show)

-- Location of a shape should be the coordinates of its center point in a 2D plane.
-- Using Coordinates as a type as well as a constructor
data Coordinates = Coordinates Double Double deriving (Show)

-- Create a new type for a shape with the coordinates of its center
data LocatedShape = LocatedShape Geometry Coordinates deriving (Show)


-- We can now created located shapes by creating nested constructors
located :: LocatedShape
located = LocatedShape (Square 2) (Coordinates 2 3)

-- Functions on nested types
-- Given a located shape, lets write a function that takes another coordinate point and checks whether its contained insite the shape 
containedIn :: Coordinates -> LocatedShape -> Bool 
-- The function eq here, we are applying nested pattern matching on the located shape
(Coordinates x y) `containedIn` (LocatedShape shape (Coordinates cx cy)) = 
    -- More readable to not define shape and match it in a case statement to keep it as one equation
    case shape of 
        -- Checks if coordinate is insider the permiter of shape
        (Circle r) -> (cx - x)^2 + (cy - y)^2 <= r 
        (Rectangle a b) -> abs (cx - x) <= a / 2 && abs (cy - y) <= b / 2
        (Square a) -> abs (cx - x) <= a / 2 && abs (cy - a) <= a / 2