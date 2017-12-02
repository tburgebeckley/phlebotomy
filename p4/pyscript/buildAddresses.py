from csv import reader

address = open("address.csv", "r")
read = reader(address)

i = 0
for row in read:
    print '\t(\'' + row[0] + '\',\'' + row[1] + '\',\'' + row[2] + '\',' + row[3] + '),'
       
