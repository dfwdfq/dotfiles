#!/usr/bin/env fish

set ktfs (kitten query-terminal font_size | tr -d -c 0-9)

if test $ktfs = 10
   clear
   set ch_todo (batcat ~/docs/todos/current.org --style=grid | fzf)
   fish ~/.config/scripts/set-todo.fish $ch_todo
end   

