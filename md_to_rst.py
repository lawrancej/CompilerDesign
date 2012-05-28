import os
files = [x.split(".")[0].rstrip() for x in os.popen("ls")]
for file in files:
    os.popen("pandoc -f rst -t markdown {0}.md -o {0}.rst".format(file))
