import System.Random

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen = let
    (first, newGen) = random gen
    (second, newGen') = random newGen
    (third, newGen'') = random newGen'
    in (first, second, third)

-- random : (RandomGen g, Random a) => g -> (a, g)
-- RandomGen typeclass is for types that can act as sources of randomness

-- The following give the same result each time
t0 = randoms (mkStdGen 11) :: [Int]
t1 = randomR (1 :: Int ,6) (mkStdGen 359353)