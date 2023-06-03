data Geometry = Rectangle Double Double | Square Double | Circle Double deriving (Show)
data Coordinates = Coordinates Double Double deriving (Show)
data LocatedShape = LocatedShape Geometry Coordinates deriving (Show)

-- Func move which takes a LocatedShape and moves it to a new location 
data Vector = Vector Double Double deriving (Show)

move :: LocatedShape -> Vector -> LocatedShape
move (LocatedShape shape (Coordinates x y)) (Vector vx vy) = LocatedShape shape (Coordinates (x + vx) (y + vy))

data BoolFunc = BoolFunc (Bool -> Bool)

-- Ex: Two boolean functions should be equal when they return the same values on all possible inputs 

instance Eq BoolFunc where
    (==) :: BoolFunc -> BoolFunc -> Bool
    BoolFunc f == BoolFunc g = f True == g True && f False == g False

trueBool :: Bool -> Bool 
trueBool _ = True 

falseBool :: Bool -> Bool 
falseBool _ = False

main = do 
        print (move (LocatedShape (Square 2) (Coordinates 2 3)) (Vector 2 1))
        print (BoolFunc trueBool == BoolFunc falseBool)