function todo-set
    echo $argv[1] > ~/.current_todo
    qtile cmd-obj -o widget TODO_TITLE -f update -a $argv[1]
end    
