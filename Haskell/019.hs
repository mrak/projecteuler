import Data.Map hiding (foldl')
import Data.List (foldl')

nDaysOfWeek = 7
data Day   = Sunday
           | Monday
           | Tuesday
           | Wednesday
           | Thursday
           | Friday
           | Saturday
           deriving (Show, Eq, Ord, Read, Enum, Bounded)

nMonthsInYear = 12
data Month = January
           | February
           | March
           | April
           | May
           | June
           | July
           | August
           | September
           | October
           | November
           | December
           deriving (Show, Eq , Ord, Read, Enum, Bounded)

monthDays :: Int -> [Int]
monthDays y = [ 31
              , if isLeapYear y then 29 else 28
              , 31
              , 30
              , 31
              , 30
              , 31
              , 31
              , 30
              , 31
              , 30
              , 31
              ]

isLeapYear y | y `rem` 100 == 0 = y `rem` 400 == 0
             | otherwise        = y `rem` 4 == 0

type EndDay = Day
type StartDay = Day

startOfNextYear :: Int -> StartDay -> StartDay
startOfNextYear y d = if isLeapYear y
                   then toEnum (dayRem 366 d)::Day
                   else toEnum (dayRem 365 d)::Day
                   where dayRem ds d = (ds + fromEnum d) `rem` 7

firstSundaysInYear :: Int -> StartDay -> Int
firstSundaysInYear y d = snd $ foldl' sundayCount (fromEnum d, 0) (monthDays y)
                     where sundayCount (d, s) ds | d `rem` 7 == 0 = (d + ds `rem` 7, s + 1)
                                                 | otherwise      = (d + ds `rem` 7, s)

main = print $ snd $ foldl' fun (startOfNextYear 1900 Monday, 0) [1901..2000]
   where fun (d, s) y = (startOfNextYear y d, s + firstSundaysInYear y d)
