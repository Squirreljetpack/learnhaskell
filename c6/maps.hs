map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] =[]
filter' p (x:xs)
    | p x = x : filter' p xs
    | otherwise = filter' p xs

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n:chain(n `div` 2)
    -- truncate division
    | odd n = n:chain (n*3+1)

-- How many chains have length longer than 15?
numLongChains :: Int
numLongChains = length (filter' isLong (map' chain [1..100]))
    where isLong xs = length xs > 15

