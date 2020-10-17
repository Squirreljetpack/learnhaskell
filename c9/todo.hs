import System.Environment
import System.Directory
import System.IO
import Data.List
dispatch :: [(String, [String] -> IO ())]
dispatch =  [ ("add", add)
            , ("view", view)
            , ("remove", remove)
            ]

main = do
    (command:args) <- getArgs
    let (Just action) = lookup command dispatch
    action args

add :: [String] -> IO ()
add [file, text] = do
    n <- withFile file ReadMode (\handle -> do
        hSeek handle SeekFromEnd (-1)
        c <- hGetChar handle
        if c /= '\n'
            then return True
            else return False)
    if n
        then appendFile file (text ++ "\n")
        else appendFile file ("\n" ++ text ++ "\n")


remove :: [String] -> IO ()
remove [file, line] = do
    (tempName, thdl) <- openTempFile "." "temp"
    contents <- readFile file
    let number = read line
        results = let (a,b:c) = splitAt (number-1) $ lines contents in unlines $ a ++ c
    hPutStr thdl results
    hClose thdl
    removeFile file
    renameFile tempName file

view :: [String] -> IO ()
view [file] = do
    contents <- readFile file
    putStr $ unlines $ zipWith (\a line -> show a ++ " - " ++ line) [0..] $ lines contents