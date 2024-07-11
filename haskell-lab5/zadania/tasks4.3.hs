import System.Environment
import System.IO
import System.IO.Error
import Control.Exception

riskyAction = do
    (inFileName:searchedWord:_) <- getArgs
    contents <- readFile inFileName
    let searchedWordCount = show $ length $ filter (\w -> w == searchedWord) $ words contents
    putStrLn searchedWordCount
    
exHdlr :: IOError -> IO ()
exHdlr = \ex -> if isDoesNotExistError ex
                then putStrLn "The file doesn't exist!"
                else if isUserError ex
                then putStrLn "Wrong number of run arguments!"
                else ioError ex 

main :: IO ()
main = riskyAction `catch` exHdlr 

