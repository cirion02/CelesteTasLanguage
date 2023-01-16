module TasFile where

import ProgramTreeModel

import Data.List (intercalate, replicate)

data TasCommand = TasCommand Int [String] | Breakpoint | PausePoint
instance Show TasCommand where
  show (TasCommand f []) = show f
  show (TasCommand f is) = show f ++ "," ++ intercalate "," is
  show Breakpoint = "***"
  show PausePoint = "***1"

type Tas = [TasCommand]

showTas :: Tas -> String
showTas cs = intercalate "\n" (map show cs)
  

exampleTas :: Tas
exampleTas = [
  TasCommand 20 [],
  TasCommand 5 ["R"],
  TasCommand 15 ["X","R"],
  TasCommand 50 ["L"]
  ]

exampleTas2 :: Tas
exampleTas2 = foldl (++) [] (replicate 20 exampleTas)

includeBreakPoint :: Tas -> Tas
includeBreakPoint cs = cs ++ [Breakpoint, TasCommand 1 []]

includePausePoint :: Tas -> Tas
includePausePoint cs = cs ++ [PausePoint, TasCommand 1 []]

getCommandLength :: TasCommand -> Int  -- Duration
getCommandLength (TasCommand x _) = x
getCommandLength Breakpoint = 0
getCommandLength PausePoint = 0

getTotalLength :: Tas -> Int
getTotalLength cs = sum $ map getCommandLength cs

parseTasInputCommand :: TasInputLine -> TasCommand
parseTasInputCommand (TasInputLine i cs) = TasCommand i cs
