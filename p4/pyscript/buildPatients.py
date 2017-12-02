from csv import reader
import random
import time

def getRandomBloodType():
    bloodTypes = ['A+', 'A-', "B+", "B-", "AB+", "AB-", "O+", "O-"]

    index = random.randrange(len(bloodTypes))

    return bloodTypes[index]

def strTimeProp(start, end, format, prop):
    stime = time.mktime(time.strptime(start, format))
    etime = time.mktime(time.strptime(end, format))

    ptime = stime + prop * (etime - stime)

    return time.strftime(format, time.localtime(ptime))


def randomDate(start, end, prop):
    return strTimeProp(start, end, '%Y-%m-%d', prop)
    

names = open("patientNames.csv", "r")

rows = reader(names)

startDate = "1920-01-01"
endDate = "2017-10-01"
i = 0
for row in rows:
    if i > 10:
        exit
    else:
        bt = getRandomBloodType()
        d = randomDate(startDate, endDate, random.random())
        print '\t(\'' + row[0] + ' ' + row[1] + '\', DATE \'' + d + '\', \'' + bt + '\'),'
 
