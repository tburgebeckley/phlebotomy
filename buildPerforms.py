import random



phlem = open("Phlemotomists.sql", "r")

phlemLines = phlem.readlines()

phlemNames = 100


count = raw_input("How many names would you like to generate ")


count = int(count)

random.seed()


with open("performs.sql", "w") as f:

    for i in range(0,count):
        pOff = random.randint(1,phlemNames-1)
        VOff = random.randint(0,99999)
        x = phlemLines[pOff][:-3] + ", " + str(VOff) + "),"

        print >> f, x
