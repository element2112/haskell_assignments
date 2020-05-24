-- $Id: FreeQBExpTests.hs,v 1.3 2019/10/08 13:21:22 leavens Exp $
module FreeQBExpTests where
import QBExp; import FreeQBExp; import Testing
main = dotests "FreeQBExpTests $Revision: 1.3 $" tests
tests :: [TestCase [String]]
tests = [setEq (freeQBExp (Varref "x")) "==" ["x"]
        ,setEq (freeQBExp (Not (Varref "y"))) "==" ["y"]
        ,setEq (freeQBExp (Not (Not (Varref "y")))) "==" ["y"]
        ,setEq (freeQBExp ((Varref "x") `And` (Not (Varref "y")))) "==" ["x","y"]
        ,setEq (freeQBExp ((Not (Varref "y")) `And` (Varref "x"))) "==" ["y","x"]
        ,setEq (freeQBExp (((Varref "y") `And` (Varref "x")) 
                            `And` ((Varref "x") `And` (Varref "y")))) "==" ["y","x"]
        ,setEq (freeQBExp (Forall "y" (Not (Varref "y")))) "==" []
        ,setEq (freeQBExp (Forall "y" ((Not (Varref "y")) `And` (Varref "z")))) "==" ["z"]
        ,setEq (freeQBExp (Forall "z" (Forall "y" ((Not (Varref "y")) `And` (Varref "z"))))) "==" []
        ,setEq (freeQBExp (Not 
                           ((Varref "z") 
                            `And` (Forall "z" (Forall "y" ((Varref "y") `And` (Varref "z")))))))
                    "==" ["z"]
        ,setEq (freeQBExp (((Varref "z") `And` (Varref "q"))
                            `And` (Not (Forall "z" (Forall "y" ((Varref "y") `And` (Varref "z")))))))
                    "==" ["z","q"]  ]
    where setEq = gTest setEqual
          setEqual los1 los2 = (length los1) == (length los2)
                               && subseteq los1 los2
          subseteq los1 los2 = all (\e -> e `elem` los2) los1
