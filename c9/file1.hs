import System.IO
-- main = do
--     handle <- openFile "haiku" ReadMode
--     contents <- hGetContents handle
--     putStr contents
--     hClose handle

main = do
    withFile "haiku" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr contents)

-- openFile :: FilePath -> IOMode -> IO Handle
-- type FilePath = String
-- data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
-- counterparts: hPutStrLn etc..