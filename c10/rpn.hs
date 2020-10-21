import Data.List

parse :: [Float] -> [String] -> Float
parse stack [] = head stack 
parse stack (x:xs)
    | x == "+" || x == "*" || x == "-" || x == "/" = let k= (drop 2 stack)
                                                         op = case x of "+"-> (+)
                                                                        "-" -> (-)
                                                                        "*" -> (*)
                                                                        "/" -> (/)
                in parse ((op (stack !! 1) (head stack)):k) xs
    | otherwise = parse ((read x):stack) xs

rpn :: String -> Float
rpn input = parse [] (words input)
        

-- Book implementation
solveRPN :: String -> Float
solveRPN = head . foldl' foldingFunction [] . words
    where
    foldingFunction (x:y:ys) "*" = (x * y):ys
    foldingFunction (x:y:ys) "+" = (x + y):ys
    foldingFunction (x:y:ys) "-" = (y - x):ys
    foldingFunction (x:y:ys) "/" = (y / x):ys
    foldingFunction (x:y:ys) "^" = (y ** x):ys
    foldingFunction (x:xs) "ln" = log x:xs
    foldingFunction xs "sum" = [sum xs]
    foldingFunction xs numberString = read numberString:xs