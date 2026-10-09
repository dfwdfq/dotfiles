#!/usr/bin/env fish

function __lurk
    set -l preview_cmd "batcat --color=always --style=numbers --line-range :500 {}"
    ls *.org | _fzf_ "lurking..." "" --preview $preview_cmd --preview-window 'up:60%:wrap'
end
function __choose
    printf "%s\n" $argv[2..-1] | _fzf_ $argv[1] ""
end
function _lurk_    
    set -l header $argv[1]
    set -l lst $argv[2..-1]
    set -l choice (__choose $header $lst)
    printf "cd $choice" > /tmp/dm
    source /tmp/dm
    __lurk
end

function hendrix
    set -l where_am_i_now (pwd)
    printf "cd ~/docs" > /tmp/dm
    source /tmp/dm

    set -l header (string repeat "SEX" -n32)
    set -l footer (string repeat "SEX" -n32)
    set -l d (printf "today\nyesterday" | _fzf_ "when you've been listening to Jimi Hendrix?" $footer)
    set -l opt (printf "yes\nno" | _fzf_ "choose note?" $footer)

    if test $d = 'today'
	set d (date +%F)
    else
	set d (date -d yesterday +%F)
    end
    
    if test $opt = 'yes'
	set  note (_lurk_ "choose base category" $DM_BASE_VIEW)
	set  root  (cat /tmp/dm | string split ' ' -f 2)
	set note (printf '[[file:%s/%s]]' $root $note)
    else
	set  note 'NONE'
    end
    
    printf "- %s :: %s\n" $d $note >> ~/docs/special/sex-calendar.org
    
    printf "cd %s" $where_am_i_now > /tmp/dm
    source /tmp/dm
end
