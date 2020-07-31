import Recursive

-- class Functor f where
--   fmap :: (a -> b) -> f a -> f b

-- instance Functor [] where
    -- fmap = map
-- fmap map :: Functor f => f (a -> b) -> f ([a] -> [b])

-- instance Functor Maybe where
--     fmap f (Just x) = Just (f x)
--     fmap f Nothing = Nothing

k1 = fmap (++ " HEY GUYS IM INSIDE THE JUST") (Just "Something serious.")

instance Functor Tree where
    fmap f EmptyTree = EmptyTree
    fmap f (Node x leftsub rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)

k2 = fmap (*4) (foldr treeInsert EmptyTree [5,7,3,2,1,7])


-- Left 3 :: Num a => Either a b
-- Think about the type declaration to understand why it work likes this
--   instance Functor (Either a) where
--   fmap f (Right x) = Right (f x)
--   fmap f (Left x) = Left x

-- Does Data.Map instance like this?
-- fmap Map.map :: Functor f => f (a -> b) -> f (Map.Map k a -> Map.Map k b)
--   instance Functor (Map.Map k) where
--   fmap f = Map.map f 
