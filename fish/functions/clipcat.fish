#function name: clipcat
#arguments    : any
#purpose      : put passed files into X clipboard.
function clipcat
   cat $argv | xclip -i
end