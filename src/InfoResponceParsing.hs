module InfoResponceParsing where

import Data.List (intercalate)
import Data.List.Split (splitOn)
import Helper (extractValue)
import Text.Read (readMaybe)

data ReturnValue = RVB Bool | RVF Float | RVL [Float] | RVS String | RVMissing
instance Show ReturnValue where
  show (RVB x) = show x
  show (RVF x) = show x
  show (RVL x) = show x
  show (RVS x) = x
  show (RVMissing) = "Data missing"

type GettableVariableName = String

type GettableVariable = (GettableVariableName, ReturnValue)

variablesToInfoTemplate :: [GettableVariableName] -> String
variablesToInfoTemplate vars = "CustomInfoStart$" ++ (intercalate ";" $ map (\x -> x ++ ":{" ++ x ++ "}") vars) ++ "$CustomInfoEnd" 

exampleVariables :: [GettableVariableName]
exampleVariables = ["Player.ExactPosition", "ChapterTime", "Player.CanRetry", "Player.jumpGraceTimer", "Player.X", "Player.Y", "Player.wallSpeedRetentionTimer", "Player.onGround"]

first2 :: Show a => [a] -> (a,a)
first2 (x:(y:_)) = (x,y)
first2 x = error $ "first2 called on list with less than 2 elems: " ++ show x


readFloat :: String -> Float
readFloat = read

readFloatMaybe :: String -> Maybe Float
readFloatMaybe = readMaybe

parseValue :: String -> ReturnValue
parseValue ""               = RVB False   --Dumb api shit, idk why it does this
parseValue "False"          = RVB False
parseValue "True"           = RVB True
parseValue "missing member" = RVMissing
parseValue x | elem ',' x   = RVL $ map readFloat $ splitOn "," x  -- tsrings do not have ','
             | otherwise    = case readFloatMaybe x of
                                Nothing  -> RVS x
                                (Just v) -> RVF v

parseVariable :: String -> GettableVariable           -- take 2
parseVariable var = (\(x,y) -> (x, parseValue y)) $ first2 $ splitOn ":" var

parseInfo :: String -> [GettableVariable]
parseInfo info = map parseVariable $ splitOn ";" info

extractCustomInfo :: String -> String
extractCustomInfo = extractValue "CustomInfoStart$" "$CustomInfoEnd"

getValueFromData :: GettableVariableName -> [GettableVariable] -> ReturnValue
getValueFromData n vs = case lookup n vs of
                    Nothing -> error "Get called on variable not in custom info"
                    Just x -> x
