function jd
    set key -d
    if test (count $argv) -ge 1
	set key $argv[1]
    end
    
    set opt (gdc $key | fzf --margin 10% --border $argv[2..-1])
    if test $status = 130
	return 0
    end
    if test -f $opt
	echo $opt
	return 0
    end
    
    echo "cd $opt" > /tmp/jd
    update_jd
    jd
end
