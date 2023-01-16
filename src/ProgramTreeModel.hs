module ProgramTreeModel where

data Token = 
             TNewLine             |
             TComma               |
             TDot                 |
             TOpenCurly           |
             TCloseCurly          |
             TOpenBracket         |
             TCloseBracket        |
             TInt Int             |
             TFloat Float         |
             TWhile               |
             TIf                  |
             TElse                |
             TEqual               |
             TNotEqual            |
             TLessThan            |
             TAssign              |
             TVar                 |
             TTrue                |
             TFalse               |
             TGet                 |
             TLogState            |
             TLogStack            |
             TString String       --Inputs need to be filtered out of this
  deriving (Eq,Show)
  
data TasInputLine = TasInputLine Int [String]
  deriving (Eq,Show)
  
data Literal = LiteralF Float | LiteralB Bool
  deriving (Eq,Show)
  
data ValueHolder = ValueHolderLit Literal | ValueHolderVar String | ValueHolderGet String
  deriving (Eq,Show)
  
data CompareOpperator = CompEqual | CompNotEqual | CompLessThan
  deriving (Eq,Show)
  
data Conditional = Conditional CompareOpperator ValueHolder ValueHolder
  deriving (Eq,Show)
  
data Command =
  CInput TasInputLine |
  CWhile Conditional [Command] |
  CAssign String ValueHolder |
  CIfElse Conditional [Command] [Command] |
  CEvalCond Conditional |
  CLogState |
  CLogStack
  deriving (Eq,Show)

type Program = [Command]

             
