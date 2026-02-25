#!/usr/bin/env python
import os

ff_dir = os.path.expanduser("~/.config/fish/functions/")
functions = (ff_dir+x for x in os.listdir(ff_dir))

def read_first_3(path):
    with open(path,"r") as f:
        head = [next(f) for _ in range(3)]
    return head
def parse(lst):
    name, arguments, purpose = lst
    name = name.replace("#function name:","").strip()
    arguments = arguments.replace("#arguments:","").strip()    
    purpose = purpose.replace("#purpose:","").strip()
    return name,purpose,arguments

def generate_entry(name, purpose, arguments):
    entry ="""
* ~{}~ function
** purpose
#+BEGIN_VERSE
{}
#+END_VERSE
** arguments
#+BEGIN_VERSE
{}
#+END_VERSE
    """
    return entry.format(name,purpose,arguments)

output = ["#+title: fish functions"]
for f in functions:
    name,purpose,arguments = parse(read_first_3(f))
    output.append(generate_entry(name,purpose,arguments))
    
with open("../fish-docs/fish_functions.org","w") as f:
    f.write("\n".join(output))
