import System.Environment
import System.IO.Error

-- Common
-- isAlreadyExistsError 
-- isDoesNotExistError 
-- isAlreadyInUseError 
-- isFullError
-- isEOFError
-- isIllegalOperation 
-- isPermissionError 
-- isUserError


main = do
    catchIOError trythis handler

trythis :: IO ()
trythis = do
    (filename:_) <- getArgs
    contents <- readFile filename
    putStrLn $ "This file has " ++ (show . length . lines $ contents) ++ " lines!"

handler :: IOError -> IO ()
handler e
    | isDoesNotExistError e =
        case ioeGetFileName e of Just path -> putStrLn $ "Whoops! File does not exist at: " ++
                                    path
                                 Nothing -> putStrLn "Whoops! File does not exist at unknown location!"
    | otherwise = ioError e