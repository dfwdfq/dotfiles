#!/usr/bin/env python
import sys

if len(sys.argv) != 2:
    print("usage: DONE.py <what?>",file=sys.stderr)
    sys.exit(1)

LIST = "/home/uncle_joe/docs/todos/current.org"
UPDATE = sys.argv[1]

with open(LIST,"r") as f:
    data = f.read().strip().split("\n")

current = None
try:
    with open("/home/uncle_joe/.current_todo", "r") as f:
        current = f.read().strip()
except Exception as e:
    print(str(e),file=sys.stderr)
    sys.exit(1)

well = []
for id, line in enumerate(data):
    if line == current:
        well.append(line)
        well.append(f"  - {UPDATE}")
        continue
    well.append(line)
        
with open(LIST,"w") as f:
    f.write("\n".join(well))

sys.exit(67)    
