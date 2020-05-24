module FilterInside where 

-- Worked on with Daniel Lam

filterInside :: (a -> Bool) -> [[a]] -> [[a]]

filterInside pred lst = map (filter pred) lst