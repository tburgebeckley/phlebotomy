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

def randomMessage():
    messages = ["full amount billed","partial amount billed","medicare billed","out of network","waived"]
    index = random.randrange(len(messages))
    return messages[index]

def assocDate(row):
    startDate = row[0:10]
    offset = random.randrange(5)
    date = int(startDate[8:10])
    return startDate[0:-2] + str(date+offset).zfill(2)


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

