module AddFVector where
import FVector

-- Worked on with Daniel Lam

addFVector :: (Num t) => (FVector t) -> (FVector t) -> (FVector t)

addFVector vect1 vect2 = 
    if ((size vect1) == (size vect2))
        then (FV (\i -> ((at (vect1) i) + (at (vect2) i))) (size vect1))
    else error "Sizes are different"

