function __main-menu
    printf "lurk base\nlurk misc\nsearch" | _fzf_ "DM" ""
end	
function __lurk
    set -l preview_cmd "batcat --color=always --style=numbers --line-range :500 {}"
    ls *.org | _fzf_ "lurking..." "" --preview $preview_cmd --preview-window 'up:60%:wrap'
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
	    find-sub-in-files --include="*.org"
    end

    source /tmp/dms
end
