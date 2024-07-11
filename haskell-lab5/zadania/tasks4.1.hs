import System.Environment
import System.IO

--Nie zrobiłem charCount i distinctWordCount

main = do
    (inFileName:_) <- getArgs
    contents <- readFile inFileName
    let linesCount = length $ lines contents
    let wordCount = length $ words contents
    
    let longLinesCount = length $ filter (\str -> length str > 80) $ lines contents
    putStrLn $ show linesCount ++ " " ++ show wordCount ++ " " ++ show longLinesCount
