#just copy-and-paste from gdl.fish
function gdf
    set content (ls -a (pwd))
    set dirs
    for entry in $content
	if  test -f $entry
	    set dirs $dirs $entry
	end
    end
    echo $dirs | tr ' ' '\n'
end    
