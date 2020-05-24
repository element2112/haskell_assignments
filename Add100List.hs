module Add100List where

add100_list_comp :: [Integer] -> [Integer]

add100_list_rec :: [Integer] -> [Integer]

add100_list_comp lst = [n + 100 | n <- lst]

add100_list_rec [] = []

add100_list_rec (x:xs) = (x + 100) : add100_list_rec xs
