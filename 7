#!/usr/bin/env python

import queue
import itertools

primeIncrements = queue.PriorityQueue()
primeIncrements.put((2,2))

for i in itertools.count(2):
   multiple, prime = primeIncrements.get()

   if i < multiple:
      primeIncrements.put((i+i,i))
      primeIncrements.put((multiple, prime))
      if primeIncrements.qsize() == 10001:
         print(i)
         exit()
      continue

   primeIncrements.put((multiple + prime, prime))
   sameMultiple, otherPrime = primeIncrements.get()

   while sameMultiple == multiple:
      primeIncrements.put((sameMultiple + otherPrime, otherPrime))
      sameMultiple, otherPrime = primeIncrements.get()

   primeIncrements.put((sameMultiple, otherPrime))

