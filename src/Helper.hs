module Helper (extractValue) where

import Data.List.Split (splitOn)

removeBefore :: String -> String -> String
removeBefore start text = case splitOn start text of
                            []        -> error "Empty string as data for ExtractValue"
                            (_:[])    -> error "Startstring does not appear in data for ExtractValue"  -- [ _ ]
                            (_:(x:_)) -> x

removeAfter :: String -> String -> String
removeAfter end text = case splitOn end text of
                            []        -> error "Empty string as data for ExtractValue"
                            (x:_)     -> x

extractValue :: String -> String -> String -> String
extractValue start end text = removeAfter end $ removeBefore start text
