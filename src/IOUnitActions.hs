module IOUnitActions (createManager, getInfo, saveTas, runTas, evalTas, sendCustomInfoTemplate) where

import TasFile (Tas, includeBreakPoint, includePausePoint, showTas)
import InfoResponceParsing (variablesToInfoTemplate, GettableVariable, GettableVariableName, extractCustomInfo, parseInfo)
import Helper (extractValue)

import Network.HTTP.Client
import Network.HTTP.Types.Status (statusCode)
--import System.Directory (getCurrentDirectory)
import Control.Concurrent (threadDelay)


createManager :: IO (Manager)
createManager = newManager defaultManagerSettings


baseUrl :: Int -> String
baseUrl portNumber = "http://localhost:" ++ show portNumber

getInfoDump :: Manager -> Int -> IO (String)
getInfoDump manager portNumber = do
  request <- parseRequest $ baseUrl portNumber ++ "/tas/info"
  response <- httpLbs request manager
  
  return $ show $ responseBody response

getInfo :: Manager -> Int -> IO ([GettableVariable])
getInfo manager portNumber = do
  info <- getInfoDump manager portNumber
  return $ parseInfo $ extractCustomInfo $ info
  

tasSaveFile :: String
tasSaveFile = "C:\\Users\\Cirion02\\Documents\\Python\\haskell\\CelesteTasLanguage\\CelesteTasLanguage\\IO-Files\\Sendfile.tas"

saveTas :: Tas -> IO ()
saveTas tas = do
  writeFile tasSaveFile $ showTas tas

sendTasFile :: Manager -> Int -> IO ()
sendTasFile manager portNumber = do
  request <- parseRequest $ baseUrl portNumber ++ "/tas/playtas?filePath=" ++ tasSaveFile
  response <- httpLbs request manager
    
  if (statusCode $ responseStatus response) == 200
  then return ()
  else putStrLn $ "Bad responce code: " ++ (show $ responseStatus response)

isNotRunning :: String -> Bool
isNotRunning s = case extractValue "State: " "<" s of
                  "None" -> True
                  "Enable" -> False
                  "Enable, FrameStep" -> True
                  x -> error $ "Unexpected State : " ++ x

checkForCompletion :: Manager -> Int -> IO (Bool)
checkForCompletion manager portNumber = do
  info <- getInfoDump manager portNumber
  return $ isNotRunning info 
    
    
-- define an orElse

waitForCompletion :: Manager -> Int -> IO()
waitForCompletion manager portNumber = do
  threadDelay 10000  -- parameter
  done <- checkForCompletion manager portNumber 
  if done
  then return ()
  else waitForCompletion manager portNumber
  

evalTas :: Manager -> Int -> Tas -> IO ()
evalTas manager portNumber tas = do
  if null tas then return () else do
    saveTas $ includeBreakPoint tas
    sendTasFile manager portNumber
    waitForCompletion manager portNumber

runTas :: Manager -> Int -> Tas -> IO ()
runTas manager portNumber tas = do
  if null tas then return () else do
    saveTas $ includePausePoint tas
    sendTasFile manager portNumber
    waitForCompletion manager portNumber
  
sendCustomInfoTemplate :: Manager -> Int -> [GettableVariableName] -> IO ()
sendCustomInfoTemplate manager portNumber variables = do
  request <- parseRequest $ baseUrl portNumber ++ "/tas/custominfo?template=" ++ variablesToInfoTemplate variables
  response <- httpLbs request manager
    
  if (statusCode $ responseStatus response) == 200
  then return ()
  else putStrLn $ "Bad responce code: " ++ (show $ responseStatus response)
