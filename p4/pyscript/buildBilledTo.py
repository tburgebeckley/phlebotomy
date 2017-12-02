from csv import reader
import random



text = "INSERT INTO billedTo (`insuranceCompany$name`,`invoice$id`) VALUES\n"

insert = "\t('{}',{});\n"

names = []

with open("insuranceNames.csv", 'r') as i:
    names = i.readlines()

output = ""
for i in range(100000):
    output = output + text + insert.format(names[random.randrange(len(names))][:-1],i+1)

print output
