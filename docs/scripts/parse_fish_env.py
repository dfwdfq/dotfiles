#!/usr/bin/env python
import os

config = os.path.expanduser("~/.config/fish/config.fish")

with open(config,"r") as f:
    data = "\n".join([x for x in f.read().split("\n") if x.startswith("#")]).split("#.")
data = data[:-1]


def parse(entry):
    name,purpose,value = entry.strip().split("\n")
    name = name.replace("#variable name:","").strip()
    purpose = purpose.replace("#purpose:","").strip()
    value = value.replace("#value:","").strip()
    return name,purpose,value,

def generate_entry(name, purpose, value):
    entry ="""
** ~{}~ variable
*** purpose
{}
*** value
{}
    """
    return entry.format(name,purpose,value)


output = ["#+title: environmental variables"]
for e in data:
    name,purpose,value = parse(e)
    output.append(generate_entry(name,purpose,value))
    
with open("../fish-docs/env_variables.org","w") as f:
    f.write("\n".join(output))


