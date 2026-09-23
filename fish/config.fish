if not pgrep -x emacs > /dev/null
   emacs --daemon
end   

#variable name:VISUAL
#purpose: whenever some programs needs editor they look for this variable
#value: emacs -nw
#.
set -gx VISUAL  "emacsclient -nw"
#variable name:EDITOR
#purpose: same as $VISUAL
#value: emacs -nw
#.
set -gx EDITOR  "emacsclient -nw"
#variable name:BROWSER
#purpose: look for this variable when it's required to open browser
#value: firefox
#.
set -gx BROWSER qutebrowser

alias emacs 'emacsclient -nw'

set -gx todo_root ~/docs/todos
set -gx todo_current $todo_root/current.org
set -gx todo_inbox $todo_root/inbox.org

alias todo-update 'perl ~/.config/scripts/update-todo-list.pl'
alias todo-toggle 'perl ~/.config/scripts/change-status.pl'

if status is-interactive
    set -l ktfs (kitten query-terminal font_size | tr -d -c 0-9)    
    if test $ktfs = 10
	cat $todo_current | todo-update current
	cat $todo_inbox | todo-update inbox
	clear
	todo-pick
	kitten @ close-tab --self
	kitty
    end
    welcome
end

set -gx FZF_DEFAULT_OPTS "
  --color=bg:#0a0a15,fg:#f8f8ff,hl:#6bd8ff
  --color=bg+:#3a3a55,fg+:#ffffff,hl+:#ff9dff
  --color=gutter:#0a0a15,pointer:#e7cfff,marker:#6bd8ff
  --color=border:#3a3a55,info:#a8a8d0,prompt:#6bd8ff
  --color=label:#a8a8d0,query:#f8f8ff,header:#a8a8d0
"

set -gx DM_ROOT ~/docs
set -gx DM_BASE_VIEW personal philosophy tech job idea
set -gx DM_MISC_VIEW daily todos
