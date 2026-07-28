function jd
    set opt (gdl | fzf)
    if test $status = 130
	return 0
    end
    
    echo "cd $opt" > /tmp/jd
    update_jd
    jd
end
