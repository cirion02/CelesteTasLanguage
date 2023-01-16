import IOUnitActions
import TasFile
import InfoResponceParsing
import EvaluateProgram
import ProgramTreeModel

import Lexer
import Parser

import Network.HTTP.Client
import Data.Map.Lazy as M

basePort :: Int
basePort = 32270

runLoopStep :: Manager -> Int -> State -> Tas -> Program -> IO Tas
runLoopStep m pn s t p = do
  let (s',p',t',y) = evaluateProgram s p
  case y of
    EndOfInput -> do 
      runTas m pn t'
      return $ t ++ t'
    NeedGetVariable n -> do
      runTas m pn t'
      info <- getInfo m pn
      -- print info
      let value = getValueFromData n info
      runLoopStep m pn (addStateVar n (returnValueToStateValue value)  s') (t ++ t') p'
    Log l -> do
      putStrLn l
      runTas m pn t'
      runLoopStep m pn s' (t ++ t') p' 

runLoop :: Manager -> Int -> Program -> IO Tas
runLoop manager portNumber p = runLoopStep manager portNumber M.empty [] p

main :: IO ()
main =  do
  manager <- createManager
  
  sendCustomInfoTemplate manager basePort exampleVariables
  
  codeFile <- readFile $ "code\\exampleProgram.ptas"
  let temp = alexScanTokens codeFile
  -- print temp
  let code = happyParseTokens $ temp
  
  tas <- runLoop manager basePort code
  
  putStrLn $ showTas tas
  
  --runTas manager basePort tas
  
  putStrLn "\nDone"
  
  
  
  
  
  
  {-
  codeFile <- readFile $ "code\\exampleProgram.ptas"
  let res = alexScanTokens codeFile
  mapM_ print res
  let res2 = happyParseTokens res 
  print res2
  -}
  
  
