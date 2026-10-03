function todo-match-hash
    set -l h $argv[1]
    cat $todo_current $todo_inbox | while read -l line
	#since hashed string contained TODO, so I need to replace DONE with TODO to get original hash
	set -l ch (get-hash (string replace 'DONE' 'TODO' $line))
	if test "$ch" = "$h"	    
	    echo $line
	    return 0
	end
    end
    return 1
end
