import System.Environment
import System.IO.Error
import Control.Exception

riskyAction :: IO ()
riskyAction = do (fileName:_) <- getArgs
                 contents <- readFile fileName
                 putStrLn contents
            
exHdlr :: IOError -> IO ()
exHdlr ex = case IOErrorType ex of --tutaj coś nie działa ...
                doesNotExistError -> putStrLn "The file doesn't exist!"
                userErrorType -> putStrLn "Wrong number of run arguments!"
                _ -> putStrLn "idk"

main :: IO ()
main = riskyAction `catch` exHdlr 

