#!/usr/bin/env python3
import sys
import re
import os

def parse_kitty_conf(conf_path):
    sections = []
    current_section = None
    current_desc = []
    current_lines = []

    with open(conf_path, 'r') as f:
        for line in f:
            line = line.rstrip()
            if line.startswith('#@section'):
                if current_section:
                    sections.append({
                        'title': current_section,
                        'desc': '\n'.join(current_desc),
                        'lines': current_lines
                    })
                current_section = line.replace('#@section', '', 1).strip()
                current_desc = []
                current_lines = []
            elif line.startswith('#@desc'):
                desc_line = line.replace('#@desc', '', 1).strip()
                current_desc.append(desc_line)
            elif line and not line.startswith('#'):
                current_lines.append(line)
        if current_section:
            sections.append({
                'title': current_section,
                'desc': '\n'.join(current_desc),
                'lines': current_lines
            })
    return sections

def generate_org(sections, output_path):
    with open(output_path, 'w') as f:
        f.write("#+title: Kitty Terminal Configuration\n")
        f.write("#+author: dfwdfq\n\n")
        for sec in sections:
            f.write(f"* {sec['title']}\n")
            if sec['desc']:
                f.write(f"{sec['desc']}\n\n")
            if sec['lines']:
                for line in sec['lines']:
                    f.write(f"{line}\n")
                f.write("\n")

                
sections = parse_kitty_conf(os.path.expanduser("~/.config/kitty/kitty.conf"))
generate_org(sections, "../kitty-docs/kitty.org")
