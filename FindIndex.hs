module FindIndex where
    
findIndex :: (Eq a) => a -> [a] -> Integer

findIndexHelper :: (Eq a) => a -> [a] -> Integer -> Integer

findIndex _ [] = -1

findIndex y xs = findIndexHelper y xs 0

findIndexHelper _ [] _ = -1

findIndexHelper y (x:xs) count
    | y == x = count
    | otherwise = findIndexHelper y xs (count + 1)