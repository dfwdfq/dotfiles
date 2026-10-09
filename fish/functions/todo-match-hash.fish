function todo-match-hash
    set -l h $argv[1]
    cat $todo_current $todo_inbox $todo_completed | while read -l line
	#since hashed string contained TODO, so I need to replace DONE with TODO to get original hash
	set -l ch (get-hash (string replace 'DONE' 'TODO' $line))
	set -l ch2 (get-hash $line)
	if test "$ch" = "$h" -o "$ch2" = "$h"
	    echo $line
	    return 0
	end
    end
    return 1
end
