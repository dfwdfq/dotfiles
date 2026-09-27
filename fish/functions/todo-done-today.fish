function todo-done-today
    set -l today (date "+%F")

    for file in $todo_root/log/*
	set -l h (basename -s .log $file)
	cat $file | while read -l line	    
	    if string match -q -e $today $line
		printf "%s [%s]\n" $line (todo-match-hash $h)
	    end
	end
    end
end
