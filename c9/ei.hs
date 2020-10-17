{-# LANGUAGE MultiWayIf, ViewPatterns #-}
import Data.Maybe (fromMaybe)

zipLeftover :: [a] -> [a] -> [a]
zipLeftover []     []     = []
zipLeftover xs     []     = xs
zipLeftover []     ys     = ys
zipLeftover (x:xs) (y:ys) = zipLeftover xs ys

lastN :: Int -> [a] -> [a]
lastN n xs = zipLeftover (drop n xs) xs

zipLeftover' :: [a] -> [a] -> Int -> (Int, [a])
zipLeftover' []     []     c = (c, [])
zipLeftover' xs     []     c = (c, xs)
zipLeftover' []     ys     c = (c, ys)
zipLeftover' (x:xs) (y:ys) c = zipLeftover' xs ys (c+1)

lastN' :: Int -> [a] -> (Int, [a])
lastN' n xs = zipLeftover' (drop n xs) xs 0

dropLast :: Int -> [a] -> [a]
dropLast n ls = go (drop n ls) ls
    where go [] _ = []
          go (_:xs) (y:ys) = y : go xs ys

minus :: Int -> Int -> Int
minus a b
    | b > a = 0
    | otherwise = a-b

every :: Int -> [a] -> [a]
every n xs
    | n>0  = every' n xs
    | n<0 = every' (-n) $ reverse xs
    | otherwise = []

every' :: Int -> [a] -> [a]
every' n [] =[]
every' n (x:xs) = x:(every' n $ drop (n-1) xs)

slice :: [a] -> Int -> Maybe Int -> Maybe Int -> [a]
slice [] _ _ _ = []
slice xs start (fromMaybe start -> end) (fromMaybe 1 -> skip)
    | start >= 0 = if
        | end >=0 -> every skip $ take (minus end start) (drop start xs)
        | otherwise -> every skip $ dropLast (-end) (drop start xs)
    | start <0 = if
        | end >0 -> let (t,cut) = lastN' (-start) xs in every skip $ take (end-t) cut
        | otherwise -> every skip $ take (minus end start) (lastN (-start) xs)

