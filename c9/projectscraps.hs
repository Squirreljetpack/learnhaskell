
-- import Data.Maybe (fromMaybe)

-- multiProduct :: Int -> Maybe Int -> Maybe Int -> Maybe Int -> Int
-- multiProduct req1 opt1 opt2 opt3 = req1 * opt1' * opt2' * opt3'
--     where opt1' = fromMaybe 10 opt1
--           opt2' = fromMaybe 20 opt2
--           opt3' = fromMaybe 30 opt3

-- groups p xs = go ([],[]) xs
--     where
--     go (gs,seps) xs = let (g,rest) = span p xs in
--         case rest of
--             r:est -> go (g:gs, r:seps) est
--             []    -> (reverse (g:gs), reverse seps)



-- groups p xs = let (g,rest) = span p xs in
--         case rest of
--             r:est -> let (gs,seps) = groups p est in (g:gs,r:seps)
--             []    -> ([g], [])



-- upToLastN' :: [a] -> [a] -> [a] -> [a]
-- upToLastN' [] n ys = ys
-- upToLastN' _ 0 ys = ys
-- upToLastN' (x:xs) n ys = upToLastN' xs (n-1) (x:ys)

-- upToLastN :: [a] -> Int -> [a]
-- upToLastN xs n = reverse (upToLastN' xs n [])

-- dropLast :: Int -> [a] -> [a]
-- dropLast n ls = go (drop n ls) ls
--     where go [] _ = []
--           go (_:xs) (y:ys) = y : go xs ys

-- subdex :: [a] -> Int -> Int -> [a] -> [a]
-- subdex [] end skip xs = reverse xs
-- subdex a end skip xs
--     | end > 0 = subdex (drop skip a) (end-skip) skip (head a:xs)
--     | otherwise = reverse xs

-- {-# LANGUAGE MultiParamTypeClasses, FlexibleInstances, FlexibleContexts #-}
-- module Optional where

-- class Optional1 a b r where 
--   opt1 :: (a -> b) -> a -> r

-- instance Optional1 a b b where
--   opt1 = id

-- instance Optional1 a b (a -> b) where
--   opt1 = const

-- class Optional2 a b c r where 
--   opt2 :: (a -> b -> c) -> a -> b -> r

-- instance Optional2 a b c c where
--   opt2 = id

-- instance (Optional1 b c r) => Optional2 a b c (a -> r) where
--   opt2 f _ b = \a -> opt1 (f a) b

-- {- Optional3, Optional4, etc defined similarly -}

-- {-# LANGUAGE FlexibleContexts #-}
-- module Main where
-- import Optional

-- foo :: (Optional2 Int Char String r) => r
-- foo = opt2 replicate 3 'f'

-- _5 :: Int
-- _5 = 5

-- main = do
--   putStrLn $ foo        -- prints "fff"
--   putStrLn $ foo _5     -- prints "fffff"
--   putStrLn $ foo _5 'y' -- prints "yyyyy"

-- {-# LANGUAGE Rank2Types, ImplicitParams #-}

-- multiProduct :: (Num x) => x -> ((?b::x) => x) -> ((?c::x) => x) -> ((?d::x) => x) -> x
-- multiProduct a b c d = let ?b=10 ; ?c=20 ; ?d=30 
--     in  a * b * c * d

-- test1 = multiProduct 1 ?b ?c ?d  -- 6000
-- test2 = multiProduct 2 3 4 5     -- 120

-- slice :: [a] -> Int -> ((?a::Int) => Int) -> ((?b::Int) => Int) -> [a]
-- slice [] _ _ _ = []
-- slice xs start end skip
--     | start >= 0 = if
--         | end >=0 -> every skip $ take (minus end start) (drop start xs)
--         | otherwise -> every skip $ dropLast (-end) (drop start xs)
--     | start <0 = if
--         | end >0 -> let (t,cut) = lastN' (-start) xs in every skip $ take (end-t) cut
--         | otherwise -> every skip $ take (minus end start) (lastN (-start) xs)
--     where ?a=start ; ?b=1

-- slice xs start end skip = let ?a=start ; ?b=1
--     in if start >= 0
--         then if end >=0
--             then every skip $ take (minus end start) (drop start xs)
--             else every skip $ dropLast (-end) (drop start xs)
--         else if end >0
--             then let (t,cut) = lastN' (-start) xs in every skip $ take (end-t) cut
--             else every skip $ take (minus end start) (lastN (-start) xs)

-- test2 = slice [1..19] 2 17 ?b

-- import System.IO

-- -- | Given a file handle, find the last line. There are no guarantees as to the 
-- -- position of the handle after this call, and it is expected that the given
-- -- handle is seekable.
-- hGetLastLine :: Handle -> IO String
-- hGetLastLine hdl = go "" (negate 1)
--   where
--   go s i = do
--     hSeek hdl SeekFromEnd i
--     c <- hGetChar hdl
--     if c == '\n'
--       then pure s
--       else go (c:s) (i-1)

-- nofm :: Int -> Int -> [a] -> [a]
-- nofm _ _ [] = []
-- nofm n m xs = take n xs ++ (nofm n m . drop m) xs