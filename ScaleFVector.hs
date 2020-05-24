module ScaleFVector where
import FVector

-- Worked on with Daniel Lam

scaleFVector :: (Num t) => t -> (FVector t) -> (FVector t)

scaleFVector x xs = (FV (\i -> x * (at (xs) i)) (size xs))

