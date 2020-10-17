main = do
    c <- getChar
    if c /= ' '
        then do
            putChar c
            main
        else return ()
-- While in ghci stdin and stdout are normally unbuffered, for compiled 
-- programmes, they are usually line-buffered, so nothing will actually be 
-- printed to the terminal until a newline enters the output buffer or the 
-- output buffer is full. There are two options to turn off buffering

-- a) hSetBuffering stdout NoBuffering

-- at the beginning of main

-- b) manually flush the output buffer for the prompts

--      do ...
--         putStr "Starting height (ft): "
--         hFlush stdout
--         rawStartingHeight <- getLine
--         ...

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