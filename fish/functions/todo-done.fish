function todo-done
    set -l curr_t (cat ~/.current_todo)
    set -l hash (get-hash $curr_t)

    set -l log_file ~/docs/todos/log/$hash.log
    if ! test -f $log_file
	touch $log_file
    end

    read -P "completed step:" msg
    printf "-%s\n" $msg >> $log_file
end
