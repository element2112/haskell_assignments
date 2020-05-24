module Rate where
import Data.List

-- Worked on with Daniel Lam

rate :: (Ord a) => [a] -> [(Int, a)]

rate lst = rate_helper (sort lst) 1 1

rate_helper [] acc toAdd = []
rate_helper (x:xs) acc toAdd = 
    if (xs /= [] && x == head(xs))
        then (acc, x) : rate_helper (xs) (acc) (toAdd+1)
    else (acc,x) : rate_helper (xs) (acc+toAdd) (1)
    
        
