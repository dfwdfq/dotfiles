#function name: back
#arguments: number
#purpose: instead of cd ../.. or cd ../../../ and so on.
function back -a number
   for x in (seq $number)
      cd ..
   end
end
