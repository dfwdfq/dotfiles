function __fzf__
    fzf --margin 20%\
	--border\
	--layout reverse\
	--header "find given substring in selected files"\
	--bind 'ctrl-a:select-all,ctrl-d:deselect-all'\
	--header-first\
	--header-border inline\
	--footer "TAB: select item, CTRL-a: select all, CTRL-d: deselect all"\
	--multi
end


function find-sub-in-files
    set items (gdf | __fzf__)
    read -P "substring:" sub
    
    for file in $items
	printf "searching $sub in $file:\n"
	grep -n $sub $file 
	if test $status -eq 1
	    printf "no $sub in $file.\n"
	end
	echo
    end

end
