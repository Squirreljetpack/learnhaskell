-- putStrLn :: String -> IO ()
-- getLine :: IO String
-- The empty tuple is a value of () and it also has a type of ()

main = do
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn ("Hey " ++ name ++ ", you rock!")
