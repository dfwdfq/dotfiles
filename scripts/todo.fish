#!/usr/bin/env fish

set ktfs (kitten query-terminal font_size | tr -d -c 0-9)

if test $ktfs = 10
   clear
   set ch_todo (cat ~/docs/todos/current.org | fzf --tac)
   fish ~/.config/scripts/set-todo.fish $ch_todo
   kitten @ close-tab --self
   kitty
end   

