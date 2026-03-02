#function name: gendoc
#arguments: none
#purpose: re-generate all documentation for dotfiles
function gendoc
   python ~/.config/docs/scripts/run_all.py
   set -l here (pwd)
   cd ~/.config
   git add docs/emacs-docs/* docs/kitty-docs/* docs/fish-docs/* docs/qtile-docs/*
   git commit -m"regenerated docs."
   gpush dotfiles master
   cd $here
end
