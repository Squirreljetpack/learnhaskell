
import Control.Monad
import Data.Char

-- v1
-- main = forever $ do
--     putStr "Give me some input: "
--     l <- getLine
--     putStrLn $ map toUpper l

-- the binding of getContents, and map are promises, which are fulfilled when putStr is encountered

-- v2
-- main = do
--       contents <- getContents
--       putStr (map toUpper contents)

-- v3 (with lines function)
-- main = interact toCaps

-- toCaps :: String -> String
-- toCaps input =
--     let alllines = lines input
--         capslines = map (map toUpper) alllines
--         result = unlines capslines
--     in result

main = interact $ map toUpper


-- cat haiku | ./capslocker