function gdl
    set content (ls -a (pwd))
    set dirs
    for entry in $content
	if test -d $entry
	    set dirs $dirs $entry
	end
    end
    echo $dirs | tr ' ' '\n'
end    
