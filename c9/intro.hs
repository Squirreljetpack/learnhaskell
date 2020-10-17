-- putStrLn :: String -> IO ()
-- putStr is a recursive implementation of putChar
-- getLine :: IO String
-- The empty tuple is a value of () and it also has a type of ()

main = do
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn ("Hey " ++ name ++ ", you rock!")
