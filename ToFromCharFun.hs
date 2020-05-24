module ToFromCharFun where

-- Worked on with Daniel Lam

charToNum :: Char -> Int
charToNum chr = (fromEnum chr)  

numToChar :: Int -> Char
numToChar int = (toEnum int)

toCharFun :: (Int -> Int) -> (Char -> Char)
toCharFun n chr = numToChar(n (charToNum chr))

fromCharFun :: (Char -> Char) -> (Int -> Int)
fromCharFun chr n = charToNum(chr (numToChar n))