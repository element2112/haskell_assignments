module MapFVector where
import FVector

-- Worked on with Daniel Lam

mapFVector :: (a -> b) -> (FVector a) -> (FVector b)

mapFVector func fv = (FV (\i -> (func (at fv i))) (size fv))

