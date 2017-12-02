import random

data = []

for i in range(1,500+1):

    addressID = random.randrange(1, 2500)
    data.append(addressID)

text = ""

with open("practicesAt.sql",'r') as doctor:
    text = doctor.read()
    print text
print data
print text.format(*data)
