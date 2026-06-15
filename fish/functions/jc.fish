#function name: jc
#arguments: none
#purpose: quickly change directory from available at current directory.
function jc
  eval cd (ls | fzf)
end