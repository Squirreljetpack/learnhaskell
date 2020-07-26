lostNumbers = [4,8,15,16,23,42]
combinationNumbers = [1,2,3,4] ++ [9,10,11,12]
combinationWords = "hello" ++ " " ++ "world"
-- the cons operator ":" puts things at the beginning of lists and is instantaneous
preppend = 5:[1,2,3,4,5]
sixthindex = "Steve Buscemi" !! 6
lexigraphicCompare = [3,2,1] > [2,1,0]
-- methods head, tail; last, init
-- length, null, reverse
firstThreeElements = take 3 [5,4,3,2,1]
remainingThreeElements = drop 3 [5,4,3,2,1]
-- maximum, minimum
p' = product [6,2,1,2]
-- 24
s' = sum [5,2]
-- 7
e' = 4 `elem` [3,4,5,6]
-- True
range= [3,6..20]
luls= take 12 (cycle "LOL ")
-- "LOL LOL LOL "