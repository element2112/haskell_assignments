module Txt2sms where
import Prelude hiding (Word)
type Word = String

txt2sms :: [Word] -> [Word]
txtHelper :: Word -> [Word] -> Bool

txtHelper y [] = False

txtHelper y (x:xs) = 
    if ((y == "by" && x == "the" && head xs == "way") || (y == "for" && x == "your" && head xs == "information") 
        || (y == "be" && x == "right" && head xs == "back") || (y == "laughing" && x == "out" && head xs == "loud"))
        then True
        else False

txt2sms [] = []

txt2sms (x:xs)
    | x == "you" = "u" : txt2sms xs
    | x == "are" = "r" : txt2sms xs
    | x == "your" = "ur" : txt2sms xs
    | x == "by" && (txtHelper x xs) = "btw" : txt2sms (tail (tail xs))
    | x == "for" && (txtHelper x xs) = "fyi" : txt2sms (tail (tail xs))
    | x == "boyfriend" = "bf" : txt2sms xs
    | x == "girlfriend" = "gf" : txt2sms xs
    | x == "be" && (txtHelper x xs) =  "brb" : txt2sms (tail (tail xs))
    | x == "laughing" && (txtHelper x xs) = "lol" : txt2sms (tail (tail xs))
    | x == "I" && (head xs) == "will" = "I'll" : txt2sms (tail xs)
    | x == "to" = "2" : txt2sms xs
    | x == "great" = "gr8" : txt2sms xs
    | x == "see" && (head xs) == "you" = "cya" : txt2sms (tail xs)
    | otherwise = x : txt2sms xs