#function name: gendoc
#arguments: none
#purpose: re-generate all documentation for dotfiles
function gendoc
   python ~/.config/docs/scripts/run_all.py
   cd ~/.config
   git status
end
