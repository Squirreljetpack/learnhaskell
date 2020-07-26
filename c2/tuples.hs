-- methods fst, snd operate on pairs
zipped = zip [1..] ["apple", "orange", "cherry", "mango"]
--  [(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]
let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
-- which right triangle that has integers for all sides and all sides equal to or smaller than 10 has a perimeter of 24?
let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]

