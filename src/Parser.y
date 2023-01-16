{
module Parser where

import ProgramTreeModel

import Data.List (intercalate)
import GHC.Float (int2Float)
}

%name happyParseTokens
%tokentype { Token }

%token
  newLine {TNewLine}      
  ','  {TComma}      
  '.'  {TDot}
  cOpen {TOpenCurly}
  cClose {TCloseCurly}
  '(' {TOpenBracket}
  ')' {TCloseBracket} 
  int {TInt $$}
  float {TFloat $$}
  while {TWhile}
  if {TIf}
  else {TElse}
  '==' {TEqual}
  '!=' {TNotEqual}
  '<' {TLessThan}
  '=' {TAssign}
  var {TVar}
  true {TTrue}
  false {TFalse}
  get {TGet}
  text {TString $$}
  logstate {TLogState}
  logstack {TLogStack}
  
%%

Program : Commands                      {reverse $1}  --left recursion reverses lists

Commands : Command                      {[$1]}
         | Commands newLine Command     {$3 : $1}
         | Commands newLine             {$1}

Command : TasLine                       {CInput $1}
        | Assignment                    {$1}
        | IfElseBlock                   {$1}
        | WhileBlock                    {$1}
        | logstate                      {CLogState}
        | logstack                      {CLogStack}

TasLine : int                           {TasInputLine $1 []}
        | int ',' Inputs                {TasInputLine $1 $ reverse $3}

Inputs : {- empty -}                    {[]}
       | text                           {[$1]}
       | Inputs ',' text                {$3 : $1}

Assignment : var text '=' Value         {CAssign $2 $4}

Value : true                            {ValueHolderLit $ LiteralB True}
      | false                           {ValueHolderLit $ LiteralB False}
      | float                           {ValueHolderLit $ LiteralF $1}
      | int                             {ValueHolderLit $ LiteralF $ int2Float $1}
      | get Attribute                   {ValueHolderGet $ intercalate "." $ reverse $2}
      | text                            {ValueHolderVar $1}

Attribute : text                        {[$1]}
          | Attribute '.' text          {$3 : $1}
 
WhileBlock : while '(' Conditional ')' cOpen newLine Commands cClose    {CWhile $3 $ reverse $7}

Conditional : Value Comparison Value    {Conditional $2 $1 $3}

Comparison : '=='                       {CompEqual}
           | '!='                       {CompNotEqual}
           | '<'                        {CompLessThan}
           
IfElseBlock : if '(' Conditional ')' cOpen newLine Commands cClose       {CIfElse $3 $7 []}
            
{- else currently causes a shift/reduce conflict which I need to fix -}
{- if '(' Conditional ')' cOpen newLine Commands cClose newLine else cOpen newLine Commands cClose   {CIfElse $3 $7 $13} -}

{

happyError _ = error "parse error"

}
