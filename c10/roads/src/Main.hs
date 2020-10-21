module Main where

import System.Environment
import System.Directory
import System.IO
import System.Random

data Node = Node Road (Maybe Road)
data Road = Road Int Node

data Section = Section { getA :: Int, getB :: Int, getC :: Int } deriving (Show)
type RoadSystem = [Section]

data Label = A | B | C deriving (Show)
type Path = ([(Label, Int)],Int)

main = do
    (file:x) <- getArgs
    if (length x /= 0 && (head x == "gen"))
        then do
            gen <- getStdGen
            writeFile file (generateSystem gen)
        else do
            content <- readFile file
            let bestpath = bestPath (getSystem content)
            print bestpath

groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
groupsOf n xs = take n xs : groupsOf n (drop n xs)

getSystem :: String -> RoadSystem
getSystem content = map (\[a,b,c] -> Section a b c) $ groupsOf 3 numbers
    where numbers = map read $ lines content

bestPath :: RoadSystem -> Path
bestPath system =  if disa < disb then (a,disa)
    else (b,disb)
    where ((a,disa),(b,disb)) = foldr getPath (([],0),([],0)) system

getPath :: Section -> (Path, Path)  -> (Path, Path)
getPath (Section a b c) = go
-- Section { a = getA, b = getB, c = getC } also possible
    where 
        go (([],_),([],_)) = (([(A,a)],a),([(B,b)],b))
        go ((tpath,top),(bpath,bottom))
            |top<c+bottom = (((A,a):tpath,top+a), second)
            |otherwise = (((A,a):(C,c):bpath,bottom+c+a), second)
                where second =
                        if (bottom<c+top)
                            then ((B,b):bpath,bottom+b)
                            else ((B,b):(C,c):tpath,top+c+b)
        


generateSystem :: StdGen -> String
generateSystem gen = let (n, newGen) = randomR (0,100) gen :: (Int, StdGen)
    in unlines $ map show $ take (n*3) (randomRs (0,100) newGen :: [Int])
