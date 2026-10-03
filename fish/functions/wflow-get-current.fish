function wflow-get-current
    set -l ff ~/.config/.wflow-current
    if ! test -f $ff
	echo none > $ff
    end
    cat $ff
end
