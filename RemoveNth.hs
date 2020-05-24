module RemoveNth where

removeNth :: (Eq a) => Int -> a -> [a] -> [a]
removeNth x y [] = []


removeNth num str (x:xs)
	| (num == 1 && x == str) = xs
	| (x == str && num /= 1) = x : removeNth (num - 1) str xs
	| otherwise = x : removeNth num str xs