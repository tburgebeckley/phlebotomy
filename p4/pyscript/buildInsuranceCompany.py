import random

def getRandomRegion():
    regions = ['SW','NE','MW','W','NW','SE'];

    index = random.randrange(len(regions))

    return regions[index]


companies = open("insuranceCompanies.sql", "r")

text = companies.read()

fields = []

for i in range(0,16):
    address = random.randrange(2500)
    region = getRandomRegion()

    fields.append(region)
    fields.append(address)

print text.format(*fields)
