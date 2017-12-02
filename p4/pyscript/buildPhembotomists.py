import random


first = open("first.csv", "r")
last = open("last.csv", "r")
clinics = open("clinicNames.csv", "r")


clinicLines = clinics.readlines()
firstLines = first.readlines()
lastLines = last.readlines()
clinicNames = 1965
firstNames = 5493
lastNames = 88798


count = raw_input("How many names would you like to generate ")


count = int(count)

random.seed()

with open("Phlemotomists.sql", "w") as f:
    for i in range(0,count):
        fOff = random.randint(0,firstNames-1)
        lOff = random.randint(0,lastNames-1)
        cOff = random.randint(0,clinicNames-1)

        x = "('" +firstLines[fOff][:-2] +" "+ lastLines[lOff][:-2] + "', "+ clinicLines[cOff][:-2]+"),"

        print >> f, x
