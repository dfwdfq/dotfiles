#function name: gpush
#arguments: Github repository, repository branch
#purpose: push changes to Github repository using token from docs directory.

function gpush --argument-names repo branch
   git push https://(cat ~/docs/token)@github.com/dfwdfq/$repo.git $branch
end