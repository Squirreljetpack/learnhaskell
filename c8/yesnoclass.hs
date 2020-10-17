class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _ = True

instance YesNo Bool where
    yesno = id

-- instance YesNo (Maybe a) where
--     yesno (Just _) = True
--     yesno Nothing = False

instance (YesNo a) => YesNo (Maybe a) where
    yesno (Just x) = yesno x
    yesno Nothing = False


k1 = 3 :: Int
k2 = 0::Int
t1 = yesno k1
t2 = yesno $ Just k1
t3 = yesno $ Just k2