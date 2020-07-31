main = do
    c <- getChar
    if c /= ' '
        then do
            putChar c
            main
        else return ()
    
-- same
-- import Control.Monad
-- main = do
--      c <- getChar
--      when (c /= ' ') $ do
--          putChar c
--          main

-- forever
-- import Control.Monad
-- import Data.Char
-- main = forever $ do
--     putStr "Give me some input: "
--     l <- getLine
--     putStrLn $ map toUpper l