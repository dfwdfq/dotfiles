#!/usr/bin/env python3

from pathlib import Path
from datetime import date
import os

root = Path.home() / "docs"

dirs = (
    "todos",
    "literature",
    "idea",
    "job",
    "personal",
    "tech",
    "philosophy",
)

today = date.today()
files = []

for directory in dirs:
    path = root / directory

    for file in path.iterdir():
        if file.is_file() and file.suffix == ".org":
            modified_date = date.fromtimestamp(file.stat().st_mtime)

            if modified_date == today:
                files.append(str(file))

for f in files:
    print(f"[[{f}][{os.path.basename(f)}]]")

    
