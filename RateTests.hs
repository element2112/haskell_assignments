-- $Id: RateTests.hs,v 1.2 2019/10/08 14:10:34 leavens Exp leavens $
module RateTests where
import Rate; import Testing
main :: IO ()
main = dotests2 "$Revision: 1.2 $" testsString testsBirders
testsString :: [TestCase [(Int, String)]]
testsString = -- alphabetic ordering
    [(eqTest (rate []) "==" [])
    ,(eqTest (rate ["one"]) "==" [(1,"one")])
    ,(eqTest (rate ["one","one"]) "==" [(1,"one"),(1,"one")])
    ,(eqTest (rate ["two","one","one"]) "==" [(1,"one"),(1,"one"),(3,"two")])
    ,(eqTest (rate ["abel", "charlie", "baker", "abel", "charlie", "delta", "echo"])
      "==" [(1,"abel"), (1,"abel"), (3,"baker"),
            (4,"charlie"), (4,"charlie"), (6,"delta"), (7,"echo")])
     ,(eqTest (rate ["baker", "baker", "abel", "baker", "baker"])
       "==" [(1,"abel"),(2,"baker"),(2,"baker"),(2,"baker"),(2,"baker")])
    ]
data Birder = Person String Int deriving (Show)
instance Eq Birder where { (Person _ c1) == (Person _ c2) = c1 == c2 }
-- The following Ord instance makes the person with the highest count least
instance Ord Birder where
  (Person _ count1) < (Person _ count2) = (count1 > count2) -- yes, backwards!
  compare (Person _ count1) (Person _ count2) = compare count2 count1
flBirders :: [Birder]
flBirders =  -- data from ebird.org
    [(Person "Audrey" 305),(Person "Graham" 319),(Person "John" 293)
    ,(Person "Scott" 269),(Person "Ron" 269),(Person "Tom" 267),(Person "Thomas" 225)
    ,(Person "Steven & Darcy" 295),(Person "David" 294),(Person "Chris" 312)
    ,(Person "Rangel" 281),(Person "Charles" 280),(Person "Andy" 276)
    ,(Person "Angel & Mariel" 274),(Person "Mark" 273),(Person "Kevin" 270)
    ,(Person "josh" 295),(Person "Jonathan" 290),(Person "adam" 286)
    ,(Person "Gary" 223),(Person "Brian" 257),(Person "Janet" 256)
    ,(Person "Michael" 266),(Person "Steven" 263),(Person "Eric" 261)
    ,(Person "Nancy" 223),(Person "Carlos" 224),(Person "Peter" 225)
    ]
testsBirders :: [TestCase [(Int, Birder)]]
testsBirders = 
    [(eqTest (rate []) "==" [])
    ,(eqTest (rate [(Person "Tom" 532),(Person "Pat" 532)]) "==" 
                 [(1,(Person "Tom" 532)),(1, (Person "Pat" 532))])
    ,(eqTest (rate [(Person "Pat" 532),(Person "Tom" 532)]) "==" 
                 [(1,(Person "Pat" 532)),(1, (Person "Tom" 532))])
    ,(eqTest (rate [(Person "Pat" 532),(Person "Tom" 532),(Person "Neil" 703)]) 
      "==" [(1,(Person "Neil" 703)),(2,(Person "Pat" 532)),(2, (Person "Tom" 532))])
    ,(eqTest (rate flBirders)
      "==" [(1,Person "Graham" 319),(2,Person "Chris" 312),(3,Person "Audrey" 305)
           ,(4,Person "Steven & Darcy" 295),(4,Person "josh" 295),(6,Person "David" 294)
           ,(7,Person "John" 293),(8,Person "Jonathan" 290),(9,Person "adam" 286)
           ,(10,Person "Rangel" 281),(11,Person "Charles" 280),(12,Person "Andy" 276)
           ,(13,Person "Angel & Mariel" 274),(14,Person "Mark" 273),(15,Person "Kevin" 270)
           ,(16,Person "Scott" 269),(16,Person "Ron" 269),(18,Person "Tom" 267)
           ,(19,Person "Michael" 266),(20,Person "Steven" 263),(21,Person "Eric" 261)
           ,(22,Person "Brian" 257),(23,Person "Janet" 256),(24,Person "Thomas" 225)
           ,(24,Person "Peter" 225),(26,Person "Carlos" 224)
           ,(27,Person "Gary" 223),(27,Person "Nancy" 223)])    ]
