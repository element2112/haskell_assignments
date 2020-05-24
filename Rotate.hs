module Rotate where 
import Number

rotate :: Number -> (a,a,a,a,a) -> (a,a,a,a,a)

rotate Zero (v,w,x,y,z) = (v,w,x,y,z)
rotate One (v,w,x,y,z) = (z,v,w,x,y)
rotate Two (v,w,x,y,z) = (y,z,v,w,x)
rotate Three (v,w,x,y,z) = (x,y,z,v,w)
rotate Four (v,w,x,y,z) = (w,x,y,z,v)
