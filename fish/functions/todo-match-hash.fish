function todo-match-hash
    set -l h $argv[1]
    cat $todo_current $todo_inbox | while read -l line
	set -l ch (get-hash $line)
	if test "$ch" = "$h"	    
	    echo $line
	    return 0
	end
    end
    return 1
end
