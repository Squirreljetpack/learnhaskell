bmiTell:: (RealFloat a) => a -> a -> String
bmiTell w h
    | bmi <= 18.5 = "Those are rookie numbers"
    | bmi <= 25 = "You're supposedly normal. I bet you're ugly!"
    | bmi <= 30 = "Fatty! hahahaha!"
    | otherwise = "You're a whale, congratulations!"
    where bmi = w/h^2

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b = GT
    | a == b = EQ
    | otherwise = LT

-- myCompare 1 3 or 1 `myCompare` 3

calcBmi :: (RealFloat a) => [(a,a)] -> [a]
calcBmi xs = [bmi w h | (w, h) <- xs]
    where bmi w h = w / h^2