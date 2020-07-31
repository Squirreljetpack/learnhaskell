import Data.Char

-- predicates
p1 = all isAlphaNum "bobby283"
p2 = all isSpace " \t"
p3 = all isUpper "BBQ"
p4 = all isPunctuation ".?"
p5 = all isAscii "Hello123"
p6 = words "hey guys its me"

k1 =  map generalCategory " \t\nA9?|"
-- k2 = digitToInt('a') maps to 0-9 a-z
k2 = ord 'a'
k3 = chr 97

encode :: Int -> String -> String
encode shift msg = map chr shifted
    where shifted = map (+shift) $ map ord msg