function find-sub-in-files
    if test (count $argv) -ne 1
	echo "fucked up!"
	return 1
    end

    set bind_cmd 'ctrl-a:select-all,ctrl-d:deselect-all'
    set header "find given substring in selected files"
    set footer "TAB: select item, CTRL-a: select all, CTRL-d: deselect all"
    
    set sub $argv[1]    
    set items (gdc -f | __fzf__ $header $footer --bind $bind_cmd --multi)
    
    for file in $items
	printf "searching $sub in $file:\n"
	grep -n $sub $file 
	if test $status -eq 1
	    printf "no $sub in $file.\n"
	end
	echo
    end
end
