import Control.Applicative

-- :t fmap (++) (Just "hey")
-- fmap (++) (Just "hey") :: Maybe ([Char] -> [Char])

-- :t fmap compare "A LIST OF CHARS"
-- fmap compare "A LIST OF CHARS" :: [Char -> Ordering]

k = fmap (*) [1,2,3,4]
t0 = fmap (\f -> f 9) k

-- What if we want to map a function inside a functor over another value inside a functor? Pattern matching is possible, but the following is more general

-- class (Functor f) => Applicative f where
--     pure :: a -> f a
--     (<*>) :: f (a -> b) -> f a -> f b

-- instance Applicative Maybe where
--     pure = Just
--     Nothing <*> _ = Nothing
--     (Just f) <*> something = fmap f something

t1 = Just (+3) <*> Just 9
t2 = pure (+) <*> Just 3 <*> Just 5
-- fmap (+) x <*> y <*>
-- <*> is left associative

t3 = (++) <$> Just "johntra" <*> Just "volta"
-- <$> is fmap as infix

-- instance Applicative [] where
--     pure x = [x]
--     fs <*> xs = [f x | f <- fs, x <- xs]

t4 = pure "Hey" :: [String]
t5 = [(+),(*)] <*> [1,2] <*> [3,4]

-- instance Applicative IO where
--     pure = return
    -- a <*> b = do
    --     f <- a
    --     x <- b
    --     return (f x)

myAction :: IO String
myAction = (++) <$> getLine <*> getLine


-- instance Applicative ((->) r) where
--     pure x = (\_ -> x)
--     f <*> g = \x -> f x (g x)

t6 = pure 3 "blah"
t7 = (+) <$> (+3) <*> (*100) $ 5
t8 = (\x y z -> [x,y,z]) <$> (+3) <*> (*2) <*> (/2) $ 5


-- instance Applicative ZipList where
--     pure x = ZipList (repeat x)
--     ZipList fs <*> ZipList xs = ZipList (zipWith (\f x -> f x) fs xs)

t9 = getZipList $ (,,) <$> ZipList "dog" <*> ZipList "cat" <*> ZipList "rat"
-- Applicative style with zip lists can replace zipWithN
t10 = zipWith3 (((+) .) . (+)) [1, 2, 3] [4, 5, 6] [7, 8, 9]

-- liftA2 :: (Applicative f) => (a -> b -> c) -> f a -> f b -> f c
-- liftA2 f a b = f <$> a <*> b

t11 = liftA2 (:) (Just 3) (Just [4])

-- sequenceA :: (Applicative f) => [f a] -> f [a]
-- sequenceA [] = pure []
-- sequenceA (x:xs) = (:) <$> x <*> sequenceA xs

t12 = sequenceA [Just 1, Just 2]
-- (:) <$> Just 1 <*> ((:) <$> Just 2 <*> Just [])
t13 = sequenceA [Just 3, Nothing, Just 1]
t14 = and $ sequenceA [(>4),(<10),odd] 7
t15 = sequenceA [[1,2,3],[4,5,6]]

-- sequenceA on IO is the same as sequence

-- Laws
-- pure id<*>v=v
-- pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
-- pure f <*> pure x = pure (fx)
-- u <*> pure y=pure ($y) <*> u