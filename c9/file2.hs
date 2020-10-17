import System.IO
import Data.Char
main = do
    contents <- readFile "haiku"
    writeFile "haikucaps.txt" (map toUpper contents)
    extraline <- getLine
    appendFile "haikucaps.txt" ("\n" ++ extraline ++ "\n")

-- Lazy IO is like connecting a pipe from the file to the output
-- Pipe width or Buffer size is by line for text and by chunk for binary

-- main = do
--     withFile "haiku" ReadMode (\handle -> do
--         hSetBuffering handle $ BlockBuffering (Just 2048)
--         contents <- hGetContents handle
--         putStr contents)