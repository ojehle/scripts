PATH=/usr/local/bin:$PATH
export PATH
mdir=$(pwd)
dirs=$(find monex -type d -depth 2 | grep -v '.git')
for i in $dirs; do
    echo $i
    cd $i
    repo=${i#*\/} 
    git pull --all
    git remote rm glab 2>/dev/null
    git remote add glab ssh://git@localhost:2222/$repo
    git push glab 
    git remote rm glab 2>/dev/null
    cd $mdir
done
