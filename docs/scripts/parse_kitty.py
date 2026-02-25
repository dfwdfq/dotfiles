#!/usr/bin/env python3
import sys
import os
import re

kitty_conf = os.path.expanduser("~/.config/kitty/kitty.conf")

def read_file(path):
    with open(path,"r") as f:
        return f.read().strip()
    
def extract_docs(data):
    found = re.findall("#variable name:.*\n#.*\n.*\n",data)
    result = []
    for e in found:
        name, purpose,val= e.strip().split("\n")
        name = name.replace("#variable name:","").strip()
        purpose = purpose.replace("#purpose:","").strip()
        val    = val.replace("#value:","").strip()
        result.append((name,purpose,val))
    return result

def gen_entry(name, purpose, val):
    entry = """
** variable name ~{}~ 
*** purpose
{}
*** value
{}    
    """
    return entry.format(name,purpose, val)

output = ["#+title: Kitty variables"]
for n, p, v in extract_docs(read_file(kitty_conf)):
    output.append(gen_entry(n,p,v))

with open("../kitty-docs/kitty.org","w") as f:
    f.write("\n".join(output))
    

