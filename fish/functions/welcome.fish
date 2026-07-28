function run-fzf
    set quote (fortune -s)
    fzf --margin 20%\
	--border\
	--layout reverse\
	--header "let's run..."\
	--header-first\
	--header-border inline\
	--footer "$quote" 
end

function welcome
    eval (cat ~/.config/scripts/welcome-menu-items | run-fzf)
end    
