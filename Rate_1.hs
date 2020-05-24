module Rate where
    import Data.List
    
    rate :: (Ord a) => [a] -> [(Int, a)]
    rateHelper :: (Ord a) => [a] -> Int -> [(Int, a)]
    
    rateHelper [] count = []
    
    rateHelper (x:xs) count = 
        if (xs /= [] && (head xs) == x)
            then [(count, x), (count, head xs)] ++ rateHelper (tail xs) (count)
        else
            (count, x) : (rateHelper xs (count + 1))
    
    
    rate xs = rateHelper (sort xs) 1