-- data Maybe a = Nothing | Just a
-- data (Ord k) => Map k v = ... it's a convention not to put typeclass constraints in data declarations because you'll have to put them into the function type declarations either way

-- type constructor = value constructor | value constructor ...
data Vector a = Vector a a a deriving Show

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)


vectMult :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)

scalarMult :: (Num t) => Vector t -> Vector t -> t
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n