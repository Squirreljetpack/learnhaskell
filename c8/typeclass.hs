-- class Eq a where
--     (==) :: a -> a -> Bool
--     (/=) :: a -> a -> Bool
--     x == y = not (x /= y) minimal complete definition
--     x /= y = not (x == y)

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False

instance Show TrafficLight where
    show Red = "Red light"
    show Yellow = "Yellow light"
    show Green = "Green light"

k1 = Red == Yellow
k2 = [Red, Yellow, Green]

--  class (Eq a) => Num a where ... classes can be subclasses

-- Parametrized types: How to modify one for use like a concrete type. Note the (Eq m) => class constraint.
-- instance (Eq m) => Eq (Maybe m) where
--     Just x == Just y = x == y
--     Nothing == Nothing = True
--     _ == _ = False

-- :info show
-- instances of a typeclass: which functions the typeclass defines, a list of the types in the typeclass,
-- the typeclasses that a type is an instance of
-- the type declaraction of a function

