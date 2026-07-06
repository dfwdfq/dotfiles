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
set -gx BROWSER firefox

alias emacs 'emacsclient -nw'

if status is-interactive
    fortune | cowsay
    fish ~/.config/scripts/todo.fish
end

set -gx FZF_DEFAULT_OPTS "
  --color=bg:#0a0a15,fg:#f8f8ff,hl:#6bd8ff
  --color=bg+:#3a3a55,fg+:#ffffff,hl+:#ff9dff
  --color=gutter:#0a0a15,pointer:#e7cfff,marker:#6bd8ff
  --color=border:#3a3a55,info:#a8a8d0,prompt:#6bd8ff
  --color=label:#a8a8d0,query:#f8f8ff,header:#a8a8d0
"