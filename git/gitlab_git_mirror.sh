#!/bin/bash
Token="q4byC8mkyY51RLUJWUdX"
>out.txt
curl -s -o list.json "https://gitlab.monex.li/api/v4/namespaces?private_token=$Token&per_page=100"
ns=$(jq '.[]|select(.kind=="group")| .id' <list.json)
for id in $ns
do
curl -s -o list.json "https://gitlab.monex.li/api/v4/groups/$id/projects?private_token=$Token&order_by&simple=true&per_page=100"
jq '.[] |  "\(.path_with_namespace);\(.ssh_url_to_repo)"' <list.json >>out.txt
done
curl -s -o list.json "https://gitlab.monex.li/api/v4/users/oj/projects?private_token=$Token&order_by&simple=true&per_page=100"
jq '.[] |  "\(.path_with_namespace);\(.ssh_url_to_repo)"' <list.json >>out.txt
sed "s/\"//g" <out.txt | sort -u > out.txt.1
mv out.txt.1 out.txt
export OIFS=$IFS
export IFS=";"
while read ns url
do
   d=$(dirname $ns)
   d=$(dirname $ns)
   repo=${url#*/}
   echo $d $repo
   if [ -d "$d/$repo" ]; then
    continue 
   fi
   if [ "$repo" = "mutti-svn.git" -o "$repo" = "mutti-svn.wiki.git" ]; then
    continue 
   fi
   mkdir -p $d
   pushd $d
   git clone --mirror $url 
   git clone --mirror ${url//.git/.wiki.git}
   popd
done <out.txt
export IFS=$OIFS
