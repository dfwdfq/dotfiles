#function name: j
#arguments: none
#purpose: quickly change directory from list.
function j
    set dir (cat ~/.config/jump.conf | fzf < /dev/tty)
    if test -n "$dir"
        set dir (string replace -r '^~($|/)' "$HOME/" "$dir")
        cd "$dir"
        commandline -f repaint
    end
end