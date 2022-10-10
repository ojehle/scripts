#echo git branch --set-upstream-to myfork/master
if git branch -v | grep -q main; then
  git branch --set-upstream-to origin/main
else
  echo git branch --set-upstream-to origin/XXXX
fi
  
