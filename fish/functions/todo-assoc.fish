function todo-assoc
    set -l curr_t (cat ~/.current_todo)    
    if test $curr_t = "NO TODO!"
	echo "currently no task..."
	return 1
    end
    set -l hash (get-hash $curr_t)
    emacs ~/docs/todos/assoc/$hash.org
end
