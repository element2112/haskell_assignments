module SumFVector where
import FVectorExamples;

-- this has been changed from the original
-- Worked on with Daniel Lam


sumFVector :: (Num t) => (FVector t) -> t
sumFVector (FV rule size) = let sumFVectorHelper rule size index acc = if(index >= size) then acc else sumFVectorHelper rule size (index+1) (acc+(rule index))
                                in sumFVectorHelper rule size 0 0



-- sumFVector :: (Num t) => (FVector t) -> t

-- sumFVectorHelper :: (Num t) => t -> [Int] -> (FVector t) -> t

-- sumFVector fv = sumFVectorHelper (at fv 0) (indexList (size fv)) fv

-- -- sumFVectorHelper item [] fv = item


-- sumFVectorHelper item (x:lst) fv
--     | (legalIndex fv x) = sumFVectorHelper ((item + (at fv (x+1))) lst fv)
--     | otherwise = item