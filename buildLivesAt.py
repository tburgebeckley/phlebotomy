import random

patients = open("practicesAt.sql", "w")


for i in range(1, 2000):
    addressID = random.randrange(2500)
    patientID = i

    patients.write ('\n\t(' + str(patientID) + ', ' + str(addressID) + '),')