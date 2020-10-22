module Recursive
(
    Tree(..),
    treeInsert,
    treeElem,
    numsTree
) where

-- (r)ight associative, takes precedence over 4 
infixr 5 :-:

-- data List' a = Empty | Cons { listHead :: a, ListTail :: List' a} deriving (Show, Read, Eq, Ord)

data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

k1 = 3 :-: 4 :-: 5 :-: Empty

infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)

-- While on the topic of infix operators, this is a section (+3) := x -> x+y

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = Node x EmptyTree EmptyTree
treeInsert x (Node a left right)
    | x == a = Node a left right
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)


treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right

numsTree = foldr treeInsert EmptyTree [8,6,4,1,7,3,5]