import Data.List
import Data.Function

l1 = intersperse '.' "MONKEY"
l2 = intercalate " " ["hey","there","guys"]
l3 = map sum $ transpose [[0,3,5,9],[10,0,0,9],[8,5,1,-1]]
-- add polynomials
l4 = concat [[1,2,3],[2,3]]
l5 = and $ map (>4) [5,6,7,8]
l6 = all (>4) [6,9,10]
l7 = take 10 $ iterate (*2) 1
l8 = takeWhile (>3) [6,5,4,3,2,1,2,3,4,5,4,3,2,1]
l9 = dropWhile (<3) [1,2,2,2,3,4,5,4,3,2,1]
l10 = break (==4) [1,2,3,4,5,6,5,4,3,2,1]
l11 = span (/=4) [1,2,3,4,5,6,7,4,3,2,1]
l12 = partition (>3) [1,3,5,6,3,2,1,0,3,7]
l13 = sort [8,7,6]
l14 = group [1,1,3,4,3,2,5]
l15 = map (\l@(x:xs) -> (x, length l)) . group . sort $ [1,1,3,4,3,2,5]
l16 = "cat" `isInfixOf` "im a cat burglar"
search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
    let nlen = length needle
    in foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

-- find :: (a -> Bool) -> [a] -> Maybe a
t1 = find (>4) [1,2,3,4,5,6]
t2 = 4 `elemIndex` [1,2,3,4,5,6]
t3 = elemIndices ' ' "Where are the spaces?"
t5 = findIndex (=='x') "Find x"
t6 = findIndices (`elem ` ['A'..'Z']) "Where are the Caps?"
t7 = zipWith3 (\x y z -> x+y+z) [1,2,3] [4,5,6] [10,11,12]
t8 = zip7 [1] [2] [3] [4] [5] [6] [7]

k1 = lines "first line\nsecond line\nthird line"
k2 = unlines ["first line", "second line", "third line"]
k3 = nub "Lots of words and stuff"
k4 = delete 'h' "hey there gang!"
-- Set difference, union for lists
k5 = [1..10] \\ [2,5]
k6 = "hello there" `union` "my mates"
k7 = [1,2,3,3,5] `intersect` [3,4,5] 
k7' = [1,2,3,3,5] `intersect` [3,3,3,4,5]
k8 = insert 4 [1..4]

-- genericLength, genericTake, genericDrop, genericSplitAt, genericIndex genericReplicate take/return Num type instead of Int
-- nubBy, deleteBy, unionBy, intersectBy and groupBy take a function to test for equality

-- Data.Functions
-- on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
-- f `on` g = \x y -> f (g x) (g y)

k9 = groupBy ((==) `on` (> 0)) [-4.3, -2.4, -1.2, 0.4, 2.3, 5.9, 10.5, 29.1, 5.3, -2.4, -14.5, 2.9, 2.3]
k10 = sortBy (compare `on` length) [[5,4,5,4,4],[1,2,3],[3,5,4,3],[],[2],[2,2]]