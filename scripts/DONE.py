#!/usr/bin/env python
import os, fileinput
import sys

if len(sys.argv) != 2:
    print("usage: DONE.py <what?>",file=sys.stderr)
    sys.exit(1)

LIST   = "/home/uncle_joe/docs/todos/current.org"
TARGET = "/home/uncle_joe/.current_todo"
UPDATE = sys.argv[1]
OLD = None

try:
    with open(TARGET,"r") as f:
        OLD = f.read()
except Exception as e:
    print(str(e),file=sys.stderr)
    sys.exit(1)
    

for line in fileinput.FileInput(LIST, inplace=True):
    if OLD == line:
        line += "  - "+UPDATE + os.linesep
    print(line, end="")


sys.exit(67)    
