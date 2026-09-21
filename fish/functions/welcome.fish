function welcome
    set quote (fortune -s)
    eval (cat ~/.config/scripts/welcome-menu-items | _fzf_ "let's run..." "$quote")
end    
