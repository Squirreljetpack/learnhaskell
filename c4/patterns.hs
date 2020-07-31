-- Pattern matching works on constructors (normal or recursive), and 'a' or 3 which are also constructors

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe x = "I'm not my factorial!"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial (x-1)

addVectors :: (Num a) => (a,a) -> (a,a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

l = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
summedl = [a+b | (a,b) <- l]
-- Should a pattern match fail, it will just move on to the next element.

capital :: String -> String
capital "" = "Empty String"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname