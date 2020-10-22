-- ($) :: (a -> b) -> a -> b
-- f $ x = f x

k1 = sum (filter (> 10) (map (*2) [2..10]))
k2 = sum $ filter (> 10) $ map (*2) [2..10]

k3 = map ($ 3) [(4+), (10*), (^2), sqrt]


-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- f . g = \x -> f (g x)

j0 = map (negate . abs) [-5,4,3,-2]

j1 = sum(replicate 5 (max 6.7 8.9))
j2 = sum . replicate 5 . max 6.7 $ 8.9