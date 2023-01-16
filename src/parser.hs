{-# OPTIONS_GHC -w #-}
module Parser where

import ProgramTreeModel

import Data.List (intercalate)
import GHC.Float (int2Float)
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,91) ([0,17216,0,13312,4,128,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,256,0,4096,0,0,16384,0,0,0,0,2,49152,1920,0,30732,0,0,4,13312,4,0,0,4096,0,0,0,0,32768,1,8192,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,512,0,49152,1920,0,0,0,4,0,32,0,0,0,16384,0,0,32960,7,0,0,0,0,0,16384,0,0,0,0,0,128,0,0,16384,32768,0,0,13312,4,0,0,0,1076,32768,8,0,136,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseTokens","Program","Commands","Command","TasLine","Inputs","Assignment","Value","Attribute","WhileBlock","Conditional","Comparison","IfElseBlock","newLine","','","'.'","cOpen","cClose","'('","')'","int","float","while","if","else","'=='","'!='","'='","var","true","false","get","text","%eof"]
        bit_start = st Prelude.* 36
        bit_end = (st Prelude.+ 1) Prelude.* 36
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..35]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (23) = happyShift action_8
action_0 (25) = happyShift action_9
action_0 (26) = happyShift action_10
action_0 (31) = happyShift action_11
action_0 (4) = happyGoto action_12
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (9) = happyGoto action_5
action_0 (12) = happyGoto action_6
action_0 (15) = happyGoto action_7
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (23) = happyShift action_8
action_1 (25) = happyShift action_9
action_1 (26) = happyShift action_10
action_1 (31) = happyShift action_11
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (9) = happyGoto action_5
action_1 (12) = happyGoto action_6
action_1 (15) = happyGoto action_7
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (16) = happyShift action_17
action_2 _ = happyReduce_1

action_3 _ = happyReduce_2

action_4 _ = happyReduce_5

action_5 _ = happyReduce_6

action_6 _ = happyReduce_8

action_7 _ = happyReduce_7

action_8 (17) = happyShift action_16
action_8 _ = happyReduce_9

action_9 (21) = happyShift action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (21) = happyShift action_14
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (35) = happyShift action_13
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (36) = happyAccept
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (30) = happyShift action_30
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (23) = happyShift action_23
action_14 (24) = happyShift action_24
action_14 (32) = happyShift action_25
action_14 (33) = happyShift action_26
action_14 (34) = happyShift action_27
action_14 (35) = happyShift action_28
action_14 (10) = happyGoto action_21
action_14 (13) = happyGoto action_29
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (23) = happyShift action_23
action_15 (24) = happyShift action_24
action_15 (32) = happyShift action_25
action_15 (33) = happyShift action_26
action_15 (34) = happyShift action_27
action_15 (35) = happyShift action_28
action_15 (10) = happyGoto action_21
action_15 (13) = happyGoto action_22
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (35) = happyShift action_20
action_16 (8) = happyGoto action_19
action_16 _ = happyReduce_11

action_17 (23) = happyShift action_8
action_17 (25) = happyShift action_9
action_17 (26) = happyShift action_10
action_17 (31) = happyShift action_11
action_17 (6) = happyGoto action_18
action_17 (7) = happyGoto action_4
action_17 (9) = happyGoto action_5
action_17 (12) = happyGoto action_6
action_17 (15) = happyGoto action_7
action_17 _ = happyReduce_4

action_18 _ = happyReduce_3

action_19 (17) = happyShift action_39
action_19 _ = happyReduce_10

action_20 _ = happyReduce_12

action_21 (28) = happyShift action_37
action_21 (29) = happyShift action_38
action_21 (14) = happyGoto action_36
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (22) = happyShift action_35
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_18

action_24 _ = happyReduce_17

action_25 _ = happyReduce_15

action_26 _ = happyReduce_16

action_27 (35) = happyShift action_34
action_27 (11) = happyGoto action_33
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_20

action_29 (22) = happyShift action_32
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (23) = happyShift action_23
action_30 (24) = happyShift action_24
action_30 (32) = happyShift action_25
action_30 (33) = happyShift action_26
action_30 (34) = happyShift action_27
action_30 (35) = happyShift action_28
action_30 (10) = happyGoto action_31
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_14

action_32 (19) = happyShift action_44
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (18) = happyShift action_43
action_33 _ = happyReduce_19

action_34 _ = happyReduce_21

action_35 (19) = happyShift action_42
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (23) = happyShift action_23
action_36 (24) = happyShift action_24
action_36 (32) = happyShift action_25
action_36 (33) = happyShift action_26
action_36 (34) = happyShift action_27
action_36 (35) = happyShift action_28
action_36 (10) = happyGoto action_41
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_25

action_38 _ = happyReduce_26

action_39 (35) = happyShift action_40
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_13

action_41 _ = happyReduce_24

action_42 (16) = happyShift action_47
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (35) = happyShift action_46
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (16) = happyShift action_45
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (23) = happyShift action_8
action_45 (25) = happyShift action_9
action_45 (26) = happyShift action_10
action_45 (31) = happyShift action_11
action_45 (5) = happyGoto action_49
action_45 (6) = happyGoto action_3
action_45 (7) = happyGoto action_4
action_45 (9) = happyGoto action_5
action_45 (12) = happyGoto action_6
action_45 (15) = happyGoto action_7
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_22

action_47 (23) = happyShift action_8
action_47 (25) = happyShift action_9
action_47 (26) = happyShift action_10
action_47 (31) = happyShift action_11
action_47 (5) = happyGoto action_48
action_47 (6) = happyGoto action_3
action_47 (7) = happyGoto action_4
action_47 (9) = happyGoto action_5
action_47 (12) = happyGoto action_6
action_47 (15) = happyGoto action_7
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (16) = happyShift action_17
action_48 (20) = happyShift action_51
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (16) = happyShift action_17
action_49 (20) = happyShift action_50
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_27

action_51 _ = happyReduce_23

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (reverse happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_3 : happy_var_1
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (CInput happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn7
		 (TasInputLine happy_var_1 []
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn7
		 (TasInputLine happy_var_1 $ reverse happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_0  8 happyReduction_11
happyReduction_11  =  HappyAbsSyn8
		 ([]
	)

happyReduce_12 = happySpecReduce_1  8 happyReduction_12
happyReduction_12 (HappyTerminal (TString happy_var_1))
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  8 happyReduction_13
happyReduction_13 (HappyTerminal (TString happy_var_3))
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_3 : happy_var_1
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 4 9 happyReduction_14
happyReduction_14 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TString happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (CAssign happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn10
		 (ValueHolderLit $ LiteralB True
	)

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn10
		 (ValueHolderLit $ LiteralB False
	)

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn10
		 (ValueHolderLit $ LiteralF happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  10 happyReduction_18
happyReduction_18 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn10
		 (ValueHolderLit $ LiteralF $ int2Float happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  10 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (ValueHolderGet $ intercalate "." $ reverse happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  10 happyReduction_20
happyReduction_20 (HappyTerminal (TString happy_var_1))
	 =  HappyAbsSyn10
		 (ValueHolderVar happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 (HappyTerminal (TString happy_var_1))
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  11 happyReduction_22
happyReduction_22 (HappyTerminal (TString happy_var_3))
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_3 : happy_var_1
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 8 12 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (CWhile happy_var_3 $ reverse happy_var_7
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn13
		 (Conditional happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  14 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn14
		 (CompEqual
	)

happyReduce_26 = happySpecReduce_1  14 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn14
		 (CompNotEqual
	)

happyReduce_27 = happyReduce 8 15 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (CIfElse happy_var_3 happy_var_7 []
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TNewLine -> cont 16;
	TComma -> cont 17;
	TDot -> cont 18;
	TOpenCurly -> cont 19;
	TCloseCurly -> cont 20;
	TOpenBracket -> cont 21;
	TCloseBracket -> cont 22;
	TInt happy_dollar_dollar -> cont 23;
	TFloat happy_dollar_dollar -> cont 24;
	TWhile -> cont 25;
	TIf -> cont 26;
	TElse -> cont 27;
	TEqual -> cont 28;
	TNotEqual -> cont 29;
	TAssign -> cont 30;
	TVar -> cont 31;
	TTrue -> cont 32;
	TFalse -> cont 33;
	TGet -> cont 34;
	TString happy_dollar_dollar -> cont 35;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 36 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> happyError tokens)
happyParseTokens tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


happyError _ = error "parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
