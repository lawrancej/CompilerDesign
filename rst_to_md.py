import os
files = [x.split(".")[0].rstrip() for x in os.popen("ls")]
for file in files:
    os.popen("pandoc -f markdown -t rst {0}.rst -o {0}.md".format(file))
