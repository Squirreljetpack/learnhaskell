import System.Environment
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S

-- pack :: [Word8] -> ByteString
t0 = B.pack [99,97,110]
-- Chunk "can" Empty

-- Process smaller chunks of bytes before joining them together into a strict one
t1=B.fromChunks [S.pack [40,41,42], S.pack [43,44,45], S.pack [46,47,48]]

t2 = foldr B.cons' B.empty [50..60]
-- Chunk "23456789:;<" Empty

main = do
    print t0
    print t1
    print t2
    (filename1:filename2:_) <- getArgs
    copyFile filename1 filename2

copyFile :: FilePath -> FilePath -> IO ()
copyFile source dest = do
    contents <- B.readFile source
    B.writeFile dest contents