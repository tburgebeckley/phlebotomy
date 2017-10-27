from csv import reader
import random


numPractices = 50
docs = open("docNames.csv", "r")
names = open("practiceNames.csv", "r")

nameRows = list(reader(names))
docRows = reader(docs)
i = 0
for row in docRows:
    if i > 10:
        exit
    else:
        clinic = nameRows[random.randrange(len(nameRows))]
        print '\t(\''+ row[0] + row[1] + ', M.D.\', \'' + clinic[0] + '\'),'
