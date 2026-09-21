function _fzf_
    set header $argv[1]
    set footer $argv[2]
    set extra $argv[3..-1]
    fzf --margin 20%\
	--border\
	--layout reverse\
	--header-first\
	--header-border inline\
	--header $header\
	--footer $footer\
	$extra
end
