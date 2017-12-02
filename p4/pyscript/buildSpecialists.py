import random

read_data = []


with open("doctor.sql",'r') as doctor:
    read_data = doctor.readlines()

data = read_data[0]
stop = len(read_data)
for i in range(1,len(read_data)+1):
    chance = random.randrange(5)
    if chance == 0:
        data = data + read_data[i]

print data
