import Data.Char
import Data.List

main = do
        line <- fmap (intersperse '-' . reverse . map toUpper) getLine
        putStrLn line

-- instance Functor ((->) r) where
--     fmap f g = (\x -> f (g x))


-- take the declaration fmap : : (a -> b) -> f a -> f b, replace f with (->)r (from r->a) to find that
-- fmap over functions is just composition
        -- :t fmap (*3) (+100)
        -- fmap (*3) (+100) :: (Num a) => a -> a
        -- fmap (*3) (+100) 1 => 303


-- if we write fmap :: (a -> b) -> (f a -> f b)

k :: (Functor f) => f a -> f [a]
k = fmap (replicate 3)

t0 = k (Right "foo")
t1 = k (Left "foo")
t2 = k [1,2,3,4]

-- functor laws
-- fmap id = id
--  fmap (f . g) = fmap f . fmap g

-- If you think of functors as things that output values, you can think of mapping over functors as attaching a transformation to the output of the functor that changes the value