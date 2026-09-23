function todo-pick
    set -l cur (cat $todo_current | perl -ne 'print "[C] $_"')
    set -l inb (cat $todo_inbox | perl -ne 'print "[IN] $_"')
    set -l t (printf '%s\n' $cur $inb | _fzf_ "TODO list" "")
    
    if string match -q '*[IN]*' $t
	echo $todo_inbox > ~/.current_todo_source
    else
	echo $todo_current > ~/.current_todo_source
    end
    
    todo-set (printf '%s' $t | perl -ne 'print $_ if(s/(\[IN\]|\[C\])//g)' | string trim -l)    
end
