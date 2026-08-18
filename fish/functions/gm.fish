function __fzf__
    fzf --margin 20%\
	--border\
	--layout reverse\
	--header "$argv[1]"\
	--bind "$argv[2]"\
	--header-first\
	--header-border inline\
	--footer "$argv[3]"\
	--multi
end

function __fzfmain__
    fzf --margin 20%\
	--border\
	--layout reverse\
	--header "GITTER"\
	--header-first\
	--header-border inline\
	--multi
end


set __bndlst__ 'ctrl-a:select-all,ctrl-d:deselect-all'
set __footer__ "TAB: select item, CTRL-a: select all, CTRL-d: deselect all"

function __cd__
    set staged (git diff --name-only)
    set header "files to diff"
    set items (echo $staged | tr ' ' '\n' | __fzf__ $header $__bndlst__ $__footer__)
    for i in $items
	git diff $i | batcat --paging=always
    end
end
    
function __cs__
    set staged (git diff --name-only)
    set header "files to add"
    set items (echo $staged | tr ' ' '\n' | __fzf__ $header $__bndlst__ $__footer__)
    for i in $items
	git add $i
    end
end

function __cm__
    set to_commit (git diff --cached --name-only)
    set header "modified files to unstage"
    set items (echo $to_commit | tr ' ' '\n' | __fzf__ $header $__bndlst__ $__footer__)
    for i in $items
	git restore --staged $i
    end
end

function __cu__
    set untracked (git ls-files --others --exclude-standard)
    set header "untracked files"    
    set items (echo $untracked | tr ' ' '\n' | __fzf__ $header $__bndlst__ $__footer__)
    for i in $items
	git add $i
    end
end



function __gm__
    if not test (count $argv) -eq 1 
	echo "fucked up."
	return -1
    end    

    switch $argv[1]
	case 'uu'
	    __cu__
	case 'a '
	    __cs__
	case 'u '
	    __cm__
	case 'd '
	    __cd__
        case '*'
	    echo "wut?"
	    return -2
    end    
	           
end
function gm
    if not test -d $PWD/.git
	echo "no git."
	return 0
    end
    set options "uu:add untracked files\na :stage to commit\nu :unstage from commit\nr :restore files to prev commit\nd :diff files"
    set opt (printf $options | __fzfmain__ | perl -F: -ane 'print $F[0]')
    __gm__ $opt

    git status
end    

