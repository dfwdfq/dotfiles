function gdc
    set key $argv[1]
    set content (ls -a (pwd))
    set dirs
    for entry in $content
	if test $key $entry
	    set dirs $dirs $entry
	end
    end
    echo $dirs | tr ' ' '\n'
end    
