module BinaryRelationOps where
import BinaryRelation

first :: (BinaryRelation a b) -> [a]
-- first [] = []
first lst = [fst (x,y) | (x,y) <- lst]

second :: (BinaryRelation a b) -> [b]
second [] = []
second lst = [snd (x,y) | (x,y) <- lst]

select :: ((a,b) -> Bool) -> (BinaryRelation a b) -> (BinaryRelation a b)
-- select f [] = []
select f zs = [(x,y) | (x,y) <- zs, f (x,y)]

compose :: Eq b => (BinaryRelation a b) -> (BinaryRelation b c) -> (BinaryRelation a c)
-- compose [] [] = []
compose xy pq =  [(x,q) | (x,y) <- xy, (p,q) <- pq, y == p]

