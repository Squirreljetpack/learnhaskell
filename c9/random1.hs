import System.Random
main = do
    gen <- getStdGen
    putStrLn $ take 20 (randomRs ('a','z') gen)
    gen' <- newStdGen
    -- yields a new one and updates getStdGen
    putStr $ take 20 (randomRs ('a','z') gen')