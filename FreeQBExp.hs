module FreeQBExp where
import QBExp

-- Worked on with Daniel Lam


freeQBExp :: QBExp -> (Set String)

qbHelp :: QBExp -> (Set String)

removeDups :: (Set String) -> (Set String)


qbHelp (Varref exp) = []
qbHelp (Not exp) = []
qbHelp (Forall str exp) = []
qbHelp (exp1 `And` exp2) = removeDups (freeQBExp exp2)

removeDups [] = []
removeDups (x:xs)
    | x `elem` xs = removeDups xs
    | otherwise = (x : removeDups xs)

freeQBExp (Varref str) = removeDups [str]
freeQBExp (exp1 `And` exp2) = removeDups ((freeQBExp exp1) ++ (freeQBExp exp2))
freeQBExp (Not exp) = (freeQBExp exp)
freeQBExp (Forall str exp) = qbHelp exp

