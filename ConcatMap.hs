module ConcatMap where
    import Prelude hiding (concatMap) 
    
    -- Worked with Daniel Lam
    -- Referenced http://learnyouahaskell.com/higher-order-functions#folds

    concatMap :: (a -> [b]) -> [a] -> [b] 
    concatMap f xs = foldr (\i count -> (f i) ++ count) [] xs