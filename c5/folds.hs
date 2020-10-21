import Prelude hiding (foldr, foldl)
import Data.List.Ordered


-- dropLast :: Int -> [a] -> [a]
-- dropLast n ls = go (drop n ls) ls
--     where go [] _ = []
--           go (_:xs) (y:ys) = y : go xs ys

-- foldr' :: (a -> b -> b) -> b -> [a] -> b
-- foldr' _ i [] = i
-- foldr' f i xs = foldr' f (f (last xs) i) (dropLast 1 xs)


-- Actual implementations
foldr k z = go
    where
        go [] = z
        go (y:ys) = k y (go ys)

-- stackoverflow because + is strict in both arguments
sum1 = foldr (+) 0
try1 = sum1 [1..10000000]

foldl k = go
    where
        go z [] = z
        go z (x:xs) = let z' = k z x
                    in foldl k z' xs

-- stackoverflow because of lazy reduction strategy.
-- Problem arises at evaluating z100000000 = z9999999 + 100000000, pushing 100000000, 9999999... on the stack
sum2 = foldl (+) 0
try2 = sum2 [1..10000000]

foldl' k = go
    where
        go z [] = z
        go z (x:xs) = let z' = k z x
                    in seq z' $ foldl k z' xs

-- Works
sum3 = foldl' (+) 0
try3 = sum3 [1..10000000]

-- However if the combining function is lazy in the first argument, foldl may work where foldl' hits an exception

-- foldl can be written as foldr, while foldr can be written as foldl for finite lists
foldlasr :: (a-> b-> a) -> a -> [b] -> a
foldlasr f a bs =
    foldr (\b g x -> g (f x b)) id bs a
-- TB investigated (haskell wiki)

-- Foldr is usually the right choice, in particular when transforming foldables into lists with related elements in the same order (even infinite lists)
-- Writing the accumulator as undefined is good practice for infinite lists
-- Short circuit: e.g. Add (if mod e 10==0 then 0) to : foldr (\e a -> (mod e 10)*a) 1 [1..10^7]
-- Foldl' is the other useful fold
-- for a large finite list
-- when implicit reversal is irrelevant (e.g. commutative), or when you do want to reverse your list (so you can take advantage of the implicit reverse)




-- foldr as a structural transformation

pairs :: (a->a->a) -> [a] -> [a]
pairs f (x:y:t) = f x y : pairs f t
pairs f t = t


-- Data.List.Ordered foldt
foldi :: (a->a->a) -> a -> [a] -> a
foldi f z [] = z
foldi f z (x:xs) = f x (foldi f z (pairs f xs))


primes :: (Integral a) => [a]
primes = 2 : 3 : ([5,7..] `minus`
    foldi (\(x:xs) -> (x:) . union xs) []
        [[p*p, p*p+2*p..] | p <- tail primes])


