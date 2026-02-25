#function name: mkcd
#arguments    : directory
#purpose      : make directory and then change current directory to just created one.
function mkcd --argument-names d
   mkdir $d
   cd $d
end