{
module Lexer where

import ProgramTreeModel
}

%wrapper "basic"

$newline = [\n]
$numbers = [0-9]
$stringChars = [a-zA-Z0-9]

tokens :-
  $newline                  {\_ -> TNewLine}
  $newline$white+           {\_ -> TNewLine}
  $white+                   ;
  "#".*                     ;
  ","                       {\_ -> TComma}
  $numbers+"."$numbers+     {\x -> TFloat $ read x}
  $numbers+                 {\x -> TInt $ read x}             
  "."                       {\_ -> TDot}    
  "{"                       {\_ -> TOpenCurly}           
  "}"                       {\_ -> TCloseCurly}
  "("                       {\_ -> TOpenBracket}
  ")"                       {\_ -> TCloseBracket}
  "while"                   {\_ -> TWhile}
  "if"                      {\_ -> TIf}
  "else"                    {\_ -> TElse}
  "=="                      {\_ -> TEqual}
  "!="                      {\_ -> TNotEqual}
  "<"                       {\_ -> TLessThan}
  "="                       {\_ -> TAssign}
  "var"                     {\_ -> TVar}
  "True"                    {\_ -> TTrue}
  "False"                   {\_ -> TFalse}
  "get"                     {\_ -> TGet}
  "logState"                {\_ -> TLogState}
  "logStack"                {\_ -> TLogStack}
  $stringChars+             {\s -> TString s}
  
  
{

mainn' = do
  s <- getContents
  print (alexScanTokens s)
}
