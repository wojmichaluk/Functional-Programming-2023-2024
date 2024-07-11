import System.Environment
import System.IO
import System.IO.Error
import Control.Exception

riskyAction = do
    (inFileNameOne:inFileNameTwo:outFileName:_) <- getArgs
    contentsOne <- readFile inFileNameOne
    contentsTwo <- readFile inFileNameTwo
    writeFile outFileName $ contentsOne ++ contentsTwo
    
exHdlr :: IOError -> IO ()
exHdlr = \ex -> if isDoesNotExistError ex
                then putStrLn "The file doesn't exist!"
                else if isUserError ex
                then putStrLn "Wrong number of run arguments!"
                else ioError ex 

main :: IO ()
main = riskyAction `catch` exHdlr 

