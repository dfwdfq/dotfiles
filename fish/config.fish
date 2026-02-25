#variable name:VISUAL
#purpose: whenever some programs needs editor they look for this variable
#value: emacs -nw
#.
set -gx VISUAL  "emacs -nw"
#variable name:EDITOR
#purpose: same as $VISUAL
#value: emacs -nw
#.
set -gx EDITOR  "emacs -nw"
#variable name:BROWSER
#purpose: look for this variable when it's required to open browser
#value: firefox
#.
set -gx BROWSER firefox

if status is-interactive
    fortune | cowsay
end
