-- Writing polymorphic functions
-- We write a containsMatching that apply a prpedicate to match on a list of arbitary type
-- We use an type variable to represent the type, similar to generics in python
-- A type variable is typically lowercase like a,b,c and can stand for any concrete type
containsMatching :: (a -> Bool) -> [a] -> Bool 
containsMatching test [] = False 
containsMatching test (x:xs) | test x == True = True 
                             | otherwise      = containsMatching test xs 

-- Polymorphic tuple
fst :: (a, b) -> a
fst (x, _) = x 

-- Functions can be polymorphic is both their arguement type and their returned type
-- Best to name the type variable the same as the pattern variable i.e. `a`
id :: a -> a 
id a = a

flip :: (a -> b -> c) -> (b -> a -> c)
flip f = \b a -> f a b 

(.) :: (b -> c) -> (a -> b) -> (a -> c)
f . g = \a -> f (g a)

main = do 
    print (containsMatching (>4) [1, 2, 3])
    print (containsMatching (\s -> s == "hello") ["bye", "hello"])