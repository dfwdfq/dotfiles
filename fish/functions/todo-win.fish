function todo-win
    set -l finished (cat ~/.current_todo)
    set -l source (cat ~/.current_todo_source)

    if test "$source" = "$todo_current"
	set  todol $todo_current
    else
	set  todol $todo_inbox
    end

    cat $todol | todo-toggle $finished DONE
    cat /tmp/todol > $todol
    todo-set "NO TODO!"
    rm /tmp/todol
end
