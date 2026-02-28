#!/usr/bin/env python3
import os
import importlib.util


qtile_conf = os.path.expanduser("~/.config/qtile/config.py")    
spec = importlib.util.spec_from_file_location("qtile_config", qtile_conf)
qtile_config = importlib.util.module_from_spec(spec)
spec.loader.exec_module(qtile_config)

keybindings = qtile_config.keybindings_docs.strip()

def parse_keybindings():
    result = []
    for line in keybindings.split("\n"):
        kb, purpose = line.split(":")
        result.append((kb,purpose))
    return result

def gen_entry(kb, purpose):
    entry = """
** keybinding ~{}~ 
*** purpose
{}
    """
    return entry.format(kb,purpose)

output = ["Keybindings:"]
for kb,purpose in parse_keybindings():
    output.append(gen_entry(kb,purpose))

with open("../qtile-docs/keybindings.org","w") as f:
    f.write("\n".join(output))
    
