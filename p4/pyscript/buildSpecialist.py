import random

def getRandomSpecialty():
    specialties = ["Eurology","Radiology","Anesthesiology","Obstetrics","Orthopaedics","Cardiology","Pediatrics","Dermatology","Psychiatry","Endocrinology","Oncology","Gastroenterology","Hematology","Geneology","Neurology"]
    index = random.randrange(len(specialties))
    return specialties[index]

specialty = []

for i in range(98):
    specialty.append(getRandomSpecialty())


text = ""

with open("specialist.sql", 'r') as sp:
    text = sp.read()

print text.format(*specialty)

