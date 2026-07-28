#!/usr/bin/env fish
function run-fzf
    fzf --margin 20%\
	--border\
	--layout reverse\
	--header "let's run..."\
	--header-first\
	--header-border inline\
	--footer (fortune -s)
end
eval (cat ~/.config/scripts/welcome-menu-items | run-fzf)


