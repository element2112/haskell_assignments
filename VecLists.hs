-- $Id: VecLists.hs,v 1.2 2019/09/10 13:29:20 leavens Exp leavens $
module VecLists where

-- VecLists are represented by finite lists of coordinate values.
type VecList = [Double]
scale :: Double -> VecList -> VecList
add :: VecList -> VecList -> VecList
dotprod :: VecList -> VecList -> Double

-- scale returns the VecList with each coordinate multiplied by the Double
 -- put your solution here
-- scale y [] = []
-- scale y (v:vs) = v*y : scale y vs

-- -- add returns a VecList that is the pointwise sum of the two arguments
-- -- The two arguments are assumed to have the same length.
--  -- put your solution here
-- add [] [] = []
-- add (x:xs) (y:ys) = (x+y) : add xs ys

-- -- dotprod returns the dot product of the VecList arguments
-- -- The two arguments are assumed to have the same length.
--  -- put your solution here
-- dotprod [] [] = 0.0
-- dotprod (x:xs) (y:ys) = x*y + dotprod xs ys

scale t xs = [t*x | x <- xs]
add xs ys = [(x+y) | (x,y) <- zip xs ys]

dotprod [] [] = 0
dotprod (x:xs) (y:ys) = (x*y) + dotprod xs ys