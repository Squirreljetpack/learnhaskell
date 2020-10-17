main = do
    putStr "Hello"
    putStrLn " There"
    print ["hello"]
    k3 <- getLine
    putChar 'a'
    rs <- sequence [getLine, getLine, getLine]
    print rs
    -- putStrLn.show
    k1 <- sequence (map print [1,2,3,4,5])
    print k1
    -- Note: when we evaluate an I/O action in GHCI, it's performed and then its result is printed out, unless that result is (), in which case it's not printed out
    -- sequence . map is equivalent to mapM print [1,2,3,4,5] or mapM_ which throws away the result
    -- mapM :: (Traversable t, Monad m) => (a -> m b) -> t a -> m (t b)