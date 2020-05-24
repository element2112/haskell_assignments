module ComposeFilters where

-- Worked on with Daniel Lam

composeFilters :: [(Maybe a -> Maybe a)] -> (Maybe a -> Maybe a)
composeFilters [] a = a

composeFilters lst n = composeFilters_helper lst n

composeFilters_helper (x:xs) n = 
    case (x n) of
        Nothing -> Nothing
        n -> 
            if ((length xs)) >= 1
                then composeFilters_helper (xs) n
            else n