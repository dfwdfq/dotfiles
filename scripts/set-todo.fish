#!/usr/bin/env fish
if test (count $argv) -lt 1
    echo "Usage: set-todo.fish <current TODO>"
    exit 1
end

qtile cmd-obj -o widget TODO_TITLE -f update -a $argv[1]