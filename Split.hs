module Split where
import WindowPlan
import FoldWindowPlan

-- Referenced Dr. Leavens "Follow the Grammar"

split :: String -> WindowPlan -> WindowPlan

-- split name wp =
--      let splitHelp wp = split name wp
--      in case wp of
--         (Win str w h) -> if (str == name)
--                         then Horiz [(Win name (w `div` 2) h), Win name (w `div` 2) h]
--                         else (Win str w h)
--         (Horiz wps) -> Horiz (map splitHelp wps)
--         (Vert wps) -> Vert (map splitHelp wps)

splitHelp name = foldWindowPlan 
                  (\(nm,w,h) -> if(nm == name) then Horiz [(Win nm (w `div` 2) h),(Win nm (w `div` 2) h)] else (Win nm w h))
                  Horiz
                  Vert

split name wp = splitHelp name wp




    