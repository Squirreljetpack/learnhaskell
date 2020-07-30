multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x*y*z
twowithnine= multThree 9
n1 = twowithnine 2 3
onewitheighteen = twowithnine 2
n2 = onewitheighteen 10

compareHundred :: (Num a, Ord a) => a -> Ordering
compareHundred = compare 100

isUpper :: Char -> Bool
isUpper = (`elem` ['A'..'Z'])

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f y x = f x y