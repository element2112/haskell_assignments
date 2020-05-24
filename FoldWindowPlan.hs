module FoldWindowPlan where
import WindowPlan

-- Worked on with Daniel Lam
-- Referenced "Following the Grammar" by Dr. Leavens

foldWindowPlan :: ((String,Int,Int) -> r) -> ([r] -> r) -> ([r] -> r) -> WindowPlan -> r


-- foldWindowPlan wf hf vf wp = 
--     let foldHelp wp = foldWindowPlan wf hf vf wp 
--     in case wp of 
--         (Win nm w h) -> wf (nm, w, h)
--         (Horiz wps) -> hf (map foldHelp wps)
--         (Vert wps) -> vf (map foldHelp wps)


-- also works
foldWindowPlan wf hf vf (Win wn w h) = wf (wn,w,h)
foldWindowPlan wf hf vf (Horiz wps) = hf (map (foldWindowPlan wf hf vf) wps)
foldWindowPlan wf hf vf (Vert wps) = vf (map (foldWindowPlan wf hf vf) wps)
