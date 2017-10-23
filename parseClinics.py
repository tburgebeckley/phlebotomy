names = open("clinics.csv", "r")
new = open("clinicNames.csv", "w+")


for lines in enumerate(names):
    if len(lines[1]) < 50:
        new.write('\'' + str(lines[1][:-1]) + '\'\n')


