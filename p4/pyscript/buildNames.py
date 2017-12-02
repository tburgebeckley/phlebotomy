import random


first = open("first.csv", "r")
last = open("last.csv", "r")

firstLines = first.readlines()
lastLines = last.readlines()
firstNames = 5493
lastNames = 88798


count = raw_input("How many names would you like to generate ")


count = int(count)

random.seed()


for i in range(0,count):
    fOff = random.randint(0,firstNames-1)
    lOff = random.randint(0,lastNames-1)

    print(str(firstLines[fOff])[:-1] + ", " + str(lastLines[lOff])[:-1])
