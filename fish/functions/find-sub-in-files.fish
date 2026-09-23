function find-sub-in-files
    grep -rnI --color=always . $argv | fzf --ansi --delimiter : \
	--preview 'batcat --color=always {1} --highlight-line {2}' \
	--preview-window 'up:60%:wrap' \
	--bind 'enter:become(emacs -n +{2} {1})'
end
