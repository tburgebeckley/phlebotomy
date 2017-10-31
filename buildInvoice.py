from csv import reader
import random
import time
import datetime

def strTimeProp(start, end, format, prop):
    stime = time.mktime(time.strptime(start, format))
    etime = time.mktime(time.strptime(end, format))
    ptime = stime + prop * (etime - stime)

    return time.strftime(format, time.localtime(ptime))


def randomDate(start, end, prop):
    return strTimeProp(start, end, '%Y-%m-%d', prop)

def randomMessage():
    messages = ["full amount billed","partial amount billed","medicare billed","out of network","waived"]
    index = random.randrange(len(messages))
    return messages[index]

def assocDate(row):
    date = datetime.datetime.strptime(row[0:10], '%Y-%m-%d')
    offset = random.randrange(5)
    
    return (date + datetime.timedelta(days=offset)).strftime('%Y-%m-%d')

text = "INSERT INTO invoice (`visit$id`, `billedDate`, `billedAmt`, `message`, `mileage`) VALUES \n"
v = open("selectedVisits.csv",'r')
output = ""
line = "\t({}, DATE '{}', {}, '{}', {});\n"
z = 0
for i,row in reader(v):
    
    visit = i
    billedDate = assocDate(row)
    billedAmt = float("{0:.2f}".format(random.uniform(99.9999, 225.000000000001)))
    message = randomMessage()
    mileage = float("{0:.2f}".format(random.uniform(29.9999, 225.000000000001)))
    output += text+line.format(visit, billedDate, billedAmt, message, mileage)
    z = z+1
    if z > 10:
        exit
print output

