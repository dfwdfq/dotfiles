#function name: jump
#arguments: none
#purpose: quickly change directory from list.
function j
  eval cd (cat ~/.config/jump.conf | choose)
end