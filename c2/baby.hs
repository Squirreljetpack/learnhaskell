doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleSmall x = if x > 100
    then x
    else x*2
incDoubleSmall x = (if x > 100 then x else x*2) + 1

inf = 92 `div` 10
-- Surround a function with backticks to use it as infix

-- :? shows list of interpreter commands