-- $Id: InfSet.hs,v 1.1 2015/02/12 04:17:59 leavens Exp leavens $
module InfSet where

-- Worked on with Daniel Lam

fromPred :: (a -> Bool) -> (Set a)
unionSet :: Set a -> Set a -> Set a
intersectSet :: Set a -> Set a -> Set a
inSet :: a -> Set a -> Bool
complementSet :: Set a -> Set a

data Set a = Set (a -> Bool)


fromPred p = Set (p)

unionSet (Set b) (Set c) = Set (\x -> (b x || c x))

intersectSet (Set b) (Set c) = Set (\x -> (b x && c x))

inSet x (Set p) = p x

complementSet (Set p) = Set (\x -> not (p x))