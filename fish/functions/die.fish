#function name: die
#arguments: none
#purpose: shortcut for shutdown now in flavour of my damned ol' Arch conf
function die
    cd ~/docs
    git add *
    git commit -m"update"
    git push gcrypt::https://codeberg.org/dfwdfq/docs.git
    echo "farewell, master of the jungle"
    shutdown now
end
