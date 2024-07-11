import System.Environment
import System.IO.Error
import Control.Exception

riskyAction :: IO ()
riskyAction = do (fileName:_) <- getArgs
                 contents <- readFile fileName
                 putStrLn contents
            
exHdlr :: IOError -> IO ()
exHdlr = \ex -> if isDoesNotExistError ex
                then putStrLn "The file doesn't exist!"
                else if isUserError ex
                then putStrLn "Wrong number of run arguments!"
                else ioError ex 

main :: IO ()
main = riskyAction `catch` exHdlr 

