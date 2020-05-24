module SquareEvens where

squareEvens :: [Integer] -> [Integer]

squareEvens [] = []

-- squareEvens (x:xs) = (if x `mod` 2 == 0 then x*x else x) : squareEvens xs

squareEvens (x:xs)
        | (x `mod` 2) == 0  = x*x :squareEvens xs
        | otherwise     = x : squareEvens xs

    
