removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- Integer is not bounded

factorial :: Integer -> Integer
factorial n = product [1..n]

-- Double has double precision of Float
circumference' :: Double -> Double
circumference' r = 2 * pi * r

-- type of functions :t
-- head :: [a] -> a
-- fst :: (a, b) -> a
-- elem :: (Foldable t, Eq a) => a -> t a -> Bool
-- (>) :: (Ord a) => a -> a -> Bool

s = show 3
r = read "[1,2,3,4]" ++ [3]
r2 = read "5" :: Int


-- Polymorphic constants
tupleMax = maxBound :: (Bool, Int, Char)
-- (Bounded a) => a
--  20 :: (Num t) => t
n1 = 20 :: Int
n2 = 20 :: Float
-- (*) :: (Num a) => a -> a -> a
n3 = 5 * (6 :: Integer)
-- Show and Eq are requirements to join Num
-- fromIntegral can create looser number
n4 = fromIntegral (length [1,2,3,4]) + 3.2