import qualified Data.Map as Map
import qualified Data.Set as Set

k0 = Map.empty
k1 = Map.fromList [("betty","555-2938"),("bonnie","452-2928"),("lucille","205-2928")]
k2 = Map.insert "anne" "186-3037" k1
k3 = Map.size k2
k4 = Map.lookup "betty"
k5 = Map.member "justin" k2
k6 = Map.map (++"9") k2
k7 = Map.filter (\x -> '2' < (head x)) k2

phoneBook =
    [("betty","555-2938")
    ,("betty","342-2492")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("patsy","943-2929")
    ,("patsy","827-9162")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ,("penny","555-2111")
    ]

phoneBookToMap xs = Map.fromListWith (++) $ map (\(k,v) -> (k,[v])) xs

k8 = phoneBookToMap phoneBook
k9 = Map.insertWith (++) "penny" ["666-6222"] k8

set1 = Set.fromList "I just had an anime dream. Anime... Reality... Are they so different?"
set2 = Set.fromList "The old man left his garbage can out and now his trash is all over my lawn!"
set3 = Set.intersection set1 set2
set4 = Set.delete 4 $ Set.fromList [3,4,5,4,3,4,5]
set5 = Set.fromList [2,3,4] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]
set6 = Set.map (+1) $ Set.fromList [3,4,5,6,7,2,3,4]
-- Faster but requires Ord over Eq (nub)
setNub xs = Set.toList $ Set.fromList xs