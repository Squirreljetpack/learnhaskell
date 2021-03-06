k1 = [x*2 | x <- [1..10], x*2 >= 12]
--   [12,14,16,18,20]
k2 = [ x | x <- [50..100], x `mod` 7 == 3]
--    [52,59,66,73,80,87,94]
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x, x/= 13]
-- [7..13] ->   ["BOOM!","BOOM!","BANG!"]
k3 = [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
length' xs = sum [1 | _ <- xs]
xxs = [[1,3,5,2,3,1,2,4,5], [1,2,3,4,5,6,7,8,9],
  [1,2,4,2,1,6,3,1,3,2,3,6]]
nested = [ [ x | x <- xs, even x ] | xs <- xxs]
--   [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]