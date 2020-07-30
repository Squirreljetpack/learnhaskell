import Data.List

numUniques :: (Eq a) =>  [a] -> Int
numUniques = length . nub

import qualified Data.Map as M

-- GHCI  :m + Data.List Data.Map Data.Set