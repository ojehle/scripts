#!/bin/bash
h=$(hostname -s)
if [ "$h" = "Dream920" ]; then
  cd /volume1/gitserver
fi 
repo=$(find . -type d -name "*.git")
for i in $repo
do
 pushd $i
 name=${i//\.\//}
 name=${name//\//_}
 last_commit=$(git log | head -1)
 if [ -f /volume1/gitserver_backup/$name.info ]; then
   file_commit=$(cat /volume1/gitserver_backup/$name.info)
 else
   file_commit="X"
 fi
 if [ "$last_commit" != "$file_commit" ]; then
   git bundle create /volume1/gitserver_backup/$name.bundle --all 
   echo "$last_commit" > /volume1/gitserver_backup/$name.info
 fi
 if git remote -v | grep -q github.com; then
	git push --all github
 fi
 if git remote -v | grep -q gitlab.com; then
	git push --all gitlab
 fi
 popd
done
