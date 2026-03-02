#!/usr/bin/env python3
import subprocess
import os

scripts_dir = os.path.expanduser("~/.config/docs/scripts/")
content = [scripts_dir+x for x in os.listdir(scripts_dir) if x.startswith("parse")]

for s in content:
    print(f"running '{s}'")
    subprocess.run(["python",s],capture_output=True)
