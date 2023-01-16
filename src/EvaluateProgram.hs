module EvaluateProgram where

import ProgramTreeModel
import TasFile
import InfoResponceParsing

import Data.Map.Lazy as M

data VariableValue = VS String | VF Float | VB Bool | VL [Float]
 deriving (Show, Eq)

type State = M.Map String VariableValue

data YeildReason = NeedGetVariable GettableVariableName | EndOfInput | Log String -- Yield

returnValueToStateValue :: ReturnValue -> VariableValue
returnValueToStateValue (RVB x) = VB x
returnValueToStateValue (RVF x) = VF x
returnValueToStateValue (RVL x) = undefined
returnValueToStateValue (RVS x) = VS x
returnValueToStateValue (RVMissing) = error "Trying to assign missing to a variable"

getStateVar :: String -> State -> VariableValue
getStateVar v s = case M.lookup v s of
                    Nothing -> error "Variable refenced before assignment"
                    Just x -> x

addStateVar :: String -> VariableValue -> State -> State
addStateVar   = M.insert


getHolderValue :: State -> ValueHolder -> VariableValue
getHolderValue _ (ValueHolderLit (LiteralF f)) = (VF f)
getHolderValue _ (ValueHolderLit (LiteralB b)) = (VB b)
getHolderValue s (ValueHolderVar varName) = getStateVar varName s
getHolderValue _ (ValueHolderGet _) = error "getHolderValue called in a ValueHolderGet"



evalConditional :: State -> CompareOpperator -> ValueHolder -> ValueHolder -> Bool
evalConditional s CompEqual    a b = getHolderValue s a == getHolderValue s b
evalConditional s CompNotEqual a b = getHolderValue s a /= getHolderValue s b
evalConditional s CompLessThan a b = case getHolderValue s a of
                                        VF a' -> case getHolderValue s b of
                                                    VF b' -> a' < b'
                                                    _     -> error "Less than called on non number"
                                        _     -> error "Less than called on non number"

evaluateCommand :: Tas -> State -> Program -> (State, Program, Tas, YeildReason)
evaluateCommand tas state [] = (state, [], tas, EndOfInput)
evaluateCommand tas state (h:t) = case h of
  CInput x@(TasInputLine _ _) -> evaluateCommand (parseTasInputCommand x:tas) state t
  
   --After the yield is processed a variable with the same name as the GetVariable will be in the state
  CAssign name (ValueHolderGet varName) -> (state, ((CAssign name (ValueHolderVar varName)) : t), tas, NeedGetVariable varName)
  CAssign name vh                       -> evaluateCommand tas (addStateVar name (getHolderValue' vh) state) t
  
  CIfElse (Conditional opp (ValueHolderGet varName) b) tcs fcs -> (state, 
        ((CIfElse (Conditional opp (ValueHolderVar varName) b) tcs fcs) : t), 
        tas, NeedGetVariable varName)
  CIfElse (Conditional opp a (ValueHolderGet varName)) tcs fcs -> (state, 
        ((CIfElse (Conditional opp a (ValueHolderVar varName)) tcs fcs) : t), 
        tas, NeedGetVariable varName)
  CIfElse (Conditional comp a b) tcs fcs    | evalConditional' comp a b -> evaluateCommand tas state (tcs ++ t)
                                            | otherwise                 -> evaluateCommand tas state (fcs ++ t)
  CWhile cond body -> evaluateCommand tas state ((CIfElse cond (body ++ [h]) []) : t)
  
  CLogStack -> (state, t, tas, Log $ show t)
  CLogState -> (state, t, tas, Log $ show state)
  
  _ -> undefined
  
  where
    getHolderValue' = getHolderValue state
    evalConditional' = evalConditional state
  

evaluateProgram :: State -> Program -> (State, Program, Tas, YeildReason)
evaluateProgram s p = (s', p', reverse t, y)
  where
    (s', p', t, y) = evaluateCommand [] s p

