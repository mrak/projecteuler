#!/usr/bin/env coffee

console.log [1..999].reduce ((sum, current) ->
   if current % 3 is 0 then return sum + current
   if current % 5 is 0 then return sum + current
   return sum
), 0
