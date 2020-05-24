module Height where
import WindowPlan
import FoldWindowPlan

-- Referenced Dr. Leavens "Follow the Grammar"

height :: WindowPlan -> Int

-- height (Horiz []) = 0
-- height (Vert []) = 0
-- height (Win nm w h) = h

-- height (Horiz wp) = maximum (map height wp)
-- height (Vert wp) = sum (map height wp)

heightHelp = foldWindowPlan
    (\(_,_,h) -> h)
    maximum
    sum

height (Horiz []) = 0
height (Vert []) = 0
height wp = heightHelp wp

