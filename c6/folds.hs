sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x==y then True else acc) False ys

map' :: (a -> b) ->  [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

-- How many elements does it take for the sum of the roots of all natural numbers to exceed 1000?
sqrtSums = takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))

-- foldl' is the strict version in Data.List