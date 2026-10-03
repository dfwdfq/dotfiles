function wflow-die
    rm -f ~/.config/.wflow-current
    set -l wf (wflow-get-current)
    cat ~/.config/wflow-current-tabs | while read -l tab
	kitten @ close-tab -m title:$tab 
    end
end
