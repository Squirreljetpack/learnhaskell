import System.IO
import System.Directory
import Data.List
main = do
    handle <- openFile "haikucaps.txt" ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let fileLines = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] fileLines
    putStrLn "These are your lines:"
    putStr $ unlines numberedTasks
    putStrLn "Which one do you want to delete?"
    numberString <- getLine
    let number = read numberString
        newfileLines = delete (fileLines !! number) fileLines
    hPutStr tempHandle $ unlines newfileLines
    hClose handle
    hClose tempHandle
    removeFile "haikucaps.txt"
    renameFile tempName "haikucaps.txt"
