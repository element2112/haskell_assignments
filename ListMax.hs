module ListMax where

listMax :: (Ord a) => [a] -> a

listMaxHelp :: (Ord a) => [a] -> a -> a


listMax (x:xs) = listMaxHelp xs x

listMaxHelp [] y = y

-- fully recursive
-- listMaxHelp (x:xs) y
--     | y >= x = listMaxHelp xs y
--     | otherwise = listMaxHelp xs x


-- tail recursive
listMaxHelp (x:xs) y = listMaxHelp xs (max x y)

