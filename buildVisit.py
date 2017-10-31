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

def getTestType():
    types = ['CBC', 'RBC', 'WBC', 'P', 'Hglob', 'Hcrit', 'MCV', 'BMP', 'Gluc', 'C', 'E+', 'BE', 'Trop', 'Creat', 'Lipo', 'BC']
    index = random.randrange(len(types))
    return types[index]

def getRandomRegion():
    regions = ['SW','NE','MW','W','NW','SE'];

    index = random.randrange(len(regions))

    return regions[index]
            


text = "INSERT INTO visit (`network`, `visitDate`, `testType`, `patient$id`) VALUES \n"

startDate = "2000-01-01"
endDate = "2017-10-30"
row = "\t('{}',DATE '{}', '{}', {}),\n"
for i in range(100000):
    network = getRandomRegion()
    visitDate = randomDate(startDate, endDate, random.random())
    testType = getTestType()
    patient = random.randrange(2000)+1
    text = text+row.format(network, visitDate, testType, patient)

print text

