import Recursive

-- :k shows the kind of a type, constructor etc.

-- kind of a concrete type
-- :k Int ==> Int :: *

-- kind of a type constructor
-- :k Maybe ==> Maybe :: * -> *
-- :k Either ==> Either :: * -> * -> *
-- :k Either String ==> Either :: * -> *

-- kind of a typeclass
-- :k Num ==> Num :: * -> Constraint
-- :k Functor ==> Functor :: (* -> *) -> Constraint

class Tofu t where
    tofu :: j a -> t a j

-- Tofu :: (* -> (* -> *) -> *) -> Constraint

-- a is the concrete argument, j must take a and return a concrete argument so j is (*->*).
-- t has to return a concrete and takes two types (the aforementioned) thus has the above signature

-- An example of t
data Frank a b  = Frank {frankField :: b a} deriving (Show)

-- try :t on these
k1 = Frank {frankField = Just "HAHA"}

-- Frank {frankField = Just "HAHA"} :: Frank [Char] Maybe

k2 = Frank {frankField = Node 'a' EmptyTree EmptyTree}

-- Frank {frankField = Node 'a' EmptyTree EmptyTree} :: Frank Char Tree

k3 = Frank {frankField = "YES"}

instance Tofu Frank where
    tofu x = Frank x

-- Why are type bindings required here?
k4 = tofu (Just 'a') :: Frank Char Maybe

data Barry t k p = Barry { yabba :: p, dabba :: t k }
--   Barry :: (* -> *) -> * -> * -> *

instance Functor (Barry a b) where
    fmap f (Barry { yabba = x, dabba = y}) = Barry { yabba = f x, dabba = y}