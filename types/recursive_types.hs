import Data.List.NonEmpty (NonEmpty)
import System.FilePath (combine)
-- Creating recursive types
-- Think of linked lists, where each element is a linked list itself 

-- Empty constructor represents an empty list like []
-- NonEmpty constructor takes 2 args: head of type a, and a list of type a. Its our replacement for the : operator
data List a = Empty | NonEmpty a (List a) deriving (Show)

-- Equivalent to representing [3, 2, 6] :: [Int] in our data type is
-- NonEmpty 3 (NonEmpty 2 (NonEmpty 6 Empty)) :: List Int 

-- We can work with values of our custom lists as usual by writing recursive functions with pattern matching 
elemList :: (Eq a) => a -> List a -> Bool
elemList _ Empty = False
elemList a (NonEmpty x xs) | x == a = True
                            | otherwise = elemList a xs

-- Binary Tree
-- A constructor Nil used to represent an empty tree
-- Node constructor represents an internal node. Contains a node label of type a, and left and right children of type Tree a
data Tree a = Nil | Node a (Tree a) (Tree a) deriving (Show)

intTree :: Tree Int
intTree = Node 4
        (Node 7
            (Node 19 Nil Nil)
            Nil
        )
        (Node (-3)
            (Node 8 Nil Nil)
            (Node 12 Nil Nil)
        )

-- For working with our tree data structure, recursive functions and pattern matching are once again the way to go
elemTree :: Eq t => t -> Tree t -> Bool
elemTree _ Nil = False
elemTree a (Node x left right) | a == x    = True
                               | otherwise = elemTree a left || elemTree a right

-- Inorder traversal
inorder :: Tree a -> [a]
inorder Nil = []
inorder (Node a left right) = inorder left ++ [a] ++ inorder right

-- Preorder traversal
preorder :: Tree a -> [a]
preorder Nil = []
preorder (Node a left right) = a : preorder left ++ preorder right

-- Higher-order functions on trees
-- When working with lists, we realized that many common recursion patterns could be abstracted away using higher order funcs
-- We can apply the same thing to binary trees
-- Implement a version of map for binary trees
mapTree :: (a -> b) -> Tree a -> Tree b
mapTree f Nil = Nil 
mapTree f (Node a left right) = Node (f a) (mapTree f left) (mapTree f right)

foldTree :: (a -> b -> b -> b) -> b -> Tree a -> b 
-- Replaces every Nil value by a base element z and every Node constructor by a functions that combines
-- the value of the node with the results of the two subtrees
foldTree _ z Nil = z 
foldTree f z (Node x left right) = f x (foldTree f z left) (foldTree f z right)

-- foldTree is very powerful function that can be used to implement the elemTree and inorder functions from before
elemTreeNew :: Eq a => a -> Tree a -> Bool
elemTreeNew a = foldTree check False 
    where check x l r = x == a || l || r


-- inorderNew = foldTree fcombine []
--     where fcombine x l r = l ++ [x] + r

-- Exercise: Implement a leaves function that takes a tree and returns the list of all of its leaves inorder
-- Identify a leaf that has Nil children
leaves :: Tree a -> [a]
leaves Nil = []
leaves (Node x Nil Nil) = [x]
leaves (Node x left right) = leaves left ++ leaves right


main = do
        print (elemTree 7 intTree)
        print (inorder intTree)
        print (preorder intTree)
        -- Mul all nodes by 2
        print (mapTree (*2) (
            Node 4 
            (Node (-2) Nil Nil) 
            (Node 6 Nil Nil)
            ))
        print (foldTree (\x l r -> 1 + l + r) 0 (
            Node 1
                (Node 2 Nil Nil)
                (Node 3 Nil
                    (Node (-2) Nil Nil)
                )
            ))
        print (leaves intTree)