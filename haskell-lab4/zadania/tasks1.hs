--task 1
--let MkCartesianCoord'' (x1,y1) = polarToCartesian'' (MkPolarCoord'' (1,pi/4))
--let MkCartesianCoord'' (x2,y2) = polarToCartesian'' (MkPolarCoord'' (x1,y1))
--let MkCartesianCoord'' (x2,y2) = polarToCartesian'' . (MkPolarCoord'')
-- . polarToCartesian'' (MkPolarCoord'' (1,pi/4)) ???

--task 2
sphericToCartesian :: Floating a => (a,a,a) -> (a,a,a)
sphericToCartesian (r, phi, psi) = (r * cos phi * sin psi, r * sin phi * sin psi, r * cos phi)

type CartesianCoord' a = (a,a,a)
type SphericCoord' a = (a,a,a)

sphericToCartesian' :: Floating a => SphericCoord' a -> CartesianCoord' a
sphericToCartesian' (r, phi, psi) = (r * cos phi * sin psi, r * sin phi * sin psi, r * cos phi)

newtype CartesianCoord'' a = MkCartesianCoord'' (a,a,a)
newtype SphericCoord'' a = MkSphericCoord'' (a,a,a)

sphericToCartesian'' :: Floating a => SphericCoord'' a -> CartesianCoord'' a
sphericToCartesian'' (MkSphericCoord'' (r, phi, psi)) = MkCartesianCoord'' (r * cos phi * sin psi, r * sin phi * sin psi, r * cos phi)

--współrzędne cylindryczne analogicznie

--task 3
personInfoToString :: (String,String,String) -> String
personInfoToString (nm,snm,addr) =
    "name: " ++ nm ++ ", surname: " ++ snm ++ ", addr: " ++ addr
     
--task 4
type Name' = String
type Surname' = String
type Address' = String
type PersonInfo' = (Name',Surname',Address')
type PersonInfoToStringType' = PersonInfo' -> String

personInfoToString' :: PersonInfoToStringType'
personInfoToString' (nm,snm,addr) = 
    "name: " ++ nm ++ ", surname: " ++ snm ++ ", addr: " ++ addr

--task5
newtype PersonInfo'' = MkPersonInfo (Name',Surname',Address')
personInfoToString'' :: PersonInfo'' -> String 
personInfoToString'' (MkPersonInfo(nm,snm,addr)) = 
    "name: " ++ nm ++ ", surname: " ++ snm ++ ", addr: " ++ addr
