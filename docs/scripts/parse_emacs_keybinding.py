#!/usr/bin/env python
import os
import re

init_file   = os.path.expanduser("~/.config/emacs/init.el")
custom_lisp_dir = os.path.expanduser("~/.config/emacs/lisp/")

custom_lisp = [custom_lisp_dir+x for x in os.listdir(custom_lisp_dir)]

def read_file(path):
    with open(path,"r") as f:
        return f.read().strip()

def extract_keybinding(data):
    found = re.findall(";;#keybinding:.*\n;;#.*\n",data)
    result = []
    for s in found:
        keybinding, desc = s.strip().split("\n")
        keybinding = keybinding.replace(";;#keybinding:","").strip()
        desc       = desc.replace(";;#description:","").strip()
        result.append((keybinding,desc))
    return result

def gen_entry(keybinding, desc):
    entry = """
** ~{}~ keybinding
*** purpose
{}    
    """
    return entry.format(keybinding,desc)

keybindings = []
for entry in extract_keybinding(read_file(init_file)):
    keybindings.append(entry)

    
for f in custom_lisp:
    result = extract_keybinding(read_file(f))
    if result:
        for entry in result:
            keybindings.append(entry)


output = ["#+title: Custom keybindings"]
for kb in keybindings:
    keyb, desc = kb
    output.append(gen_entry(keyb,desc))

with open("../emacs-docs/custom-keybindings.org","w") as f:
    f.write("\n".join(output))
    
