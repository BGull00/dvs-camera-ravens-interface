with open("tmp.log", "r") as fin:
    for line in fin:
        if("<CMD" in line):
            line = line.strip()
            print(line.split("<CMD> ",1)[1])