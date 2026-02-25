#function name: jump
#arguments    : none
#purpose      : quickly change directory from list.
function jump
  eval cd (cat ~/.config/jump.conf | choose)
end