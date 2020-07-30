k = zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]

addThree :: (Num a) => a -> a -> a -> a
addThree = \x -> \y -> \z -> x + y + z