from csv import reader
import random
import time

def strTimeProp(start, end, format, prop):
    stime = time.mktime(time.strptime(start, format))
    etime = time.mktime(time.strptime(end, format))

    ptime = stime + prop * (etime - stime)

    return time.strftime(format, time.localtime(ptime))

def randomDate(start, end, prop):
    return strTimeProp(start, end, '%Y-%m-%d', prop)

docs = open("doctor.sql", "r")

docsLines = docs.readlines()

docsNames = 100


startDate = "2000-01-01"
endDate = "2017-10-30"
count = raw_input("How many names would you like to generate ")


count = int(count)

random.seed()

with open("consults.sql", "w") as f:

    for i in range(0,count):
        dOff = random.randint(1,docsNames-1)
        pOff = random.randint(0,1999)
        x = "(" + str(pOff) + ", "+ docsLines[dOff][2:-4] + ", " + str(randomDate(startDate, endDate, random.random())) + "),"

        print >> f, x
