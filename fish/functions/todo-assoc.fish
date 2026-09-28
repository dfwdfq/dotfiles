function todo-assoc
    set -l curr_t (cat ~/.current_todo)    
    if test $curr_t = "NO TODO!"
	echo "currently no task..."
	return 1
    end
    set -l hash (get-hash $curr_t)
    set -l file ~/docs/todos/assoc/$hash.org
    if not test -f $file
	printf "#+title: %s\n" $curr_t > $file
    end    
    emacs $file
end
