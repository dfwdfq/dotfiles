#function name: jc
#arguments: none
#purpose: quickly change directory from available at current directory.
function jc
    set dir (ls | fzf < /dev/tty)
    if test -n "$dir"
        set dir (string replace -r '^~($|/)' "$HOME/" "$dir")
        cd "$dir"
        commandline -f repaint   # Refresh prompt after directory change
    end
end