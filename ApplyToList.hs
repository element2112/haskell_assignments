module ApplyToList where
import BinaryRelation

applyRel :: (Eq k) => k -> (BinaryRelation k v) -> [v]

applyToList :: (Eq k) => [k] -> (BinaryRelation k v) -> [v]

applyRel ky [] = []

{--applyRel ky ((x,y):as) =
    if (ky == (fst (x,y)))
        then (snd (x,y)) : applyRel ky as
    else 
        applyRel ky as--}

applyRel ky vs = [y | (x,y) <- vs, ky == x]

-- applyToList [] [] = []
applyToList [] _ = []
applyToList _ [] = []

applyToList (k:ks) vs = applyRel k vs ++ applyToList ks vs