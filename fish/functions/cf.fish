#function name: cf
#arguments: none
#purpose: invoke kitten to choose files
function cf --wraps='kitten choose-files' --description 'alias cf=kitten choose-files'
  kitten choose-files $argv
        
end
