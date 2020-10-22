import Data.Char
main = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line
            main
    
reverseWords :: String -> String
reverseWords = unwords . map reverse . words

-- return takes a pure value and encapsulates it as an IO action. Can change the IO value from the last value in a do block