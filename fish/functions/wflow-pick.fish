function wflow-pick
    set -l f (cat ~/.config/wflows/wflows-list.txt | _fzf_ "where to dive?" "")
    fish ~/.config/wflows/$f
end
