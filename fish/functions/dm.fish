function __main-menu
    printf "lurk base\nlurk misc\nsearch" | _fzf_ "DM" ""
end	
function __lurk
    set -l preview_cmd "batcat --color=always --style=numbers --line-range :500 {}"
    ls *.org | _fzf_ "lurking..." "" --preview $preview_cmd
end
function __choose
    printf "%s\n" $argv[2..-1] | _fzf_ $argv[1] ""
end
function _lurk_
    set -l header $argv[1]
    set -l lst $argv[2..-1]
    set -l choice (__choose $header $lst)
    printf "cd $choice" > /tmp/dm
    source /tmp/dm
    __lurk
end
function dm
    set -l start (pwd)
    printf "cd %s" $start > /tmp/dms
    source ~/.config/fish/jtd.fish

    set -l option (__main-menu)
    switch $option
	case "lurk base"
	    set come_in (_lurk_ "choose base category" $DM_BASE_VIEW)	    
	case "lurk misc"
	    set come_in (_lurk_ "choose misc category" $DM_MISC_VIEW)
	case "search"
	    set fuck 67
	    find-sub-in-files
    end

    if test $fuck -ne 67
	if read-confirm "open $come_in in Emacs?"
	    emacs $come_in
	end
    end
    source /tmp/dms
end
