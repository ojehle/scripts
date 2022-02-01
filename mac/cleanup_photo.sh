#!/bin/bash

function check_file() 
{
  file1=$1
  file2=$2

  if [ -f "$file2" ]; then
      old_file_info=$(mdls -name kMDItemContentCreationDate $file1)
      new_file_info=$(mdls -name kMDItemContentCreationDate "$file2")
      if [ "$old_file_info" = "$new_file_info" ]; then
         echo "delete $file1 ->  $file2 $old_file_info - $new_file_info"
         rm -f "$file2"
      fi
  fi

}
c="1 2 3 4 5 6 7 8 9 10"

#find /Users/oj/Photos_Backup -name "*.heic" | while read file; do
#
#  x="${file%.*}.jpeg"
#  check_file $file $x
#  for i in $c
#  do
#        x=${file%.*}
#	x="$x ($i).jpeg"
##     	[[ -f $x ]] && check_file $file "$x"
#  done
#
#  x="${file%.*}.mov"
#  check_file $file $x
#  for i in $c
#  do
#        x=${file%.*}
#	x="$x ($i).mov"
#     	[[ -f $x ]] && check_file $file "$x"
#  done
#done
   
find /Users/oj/Photos_Backup -name "*.mov" | while read file; do

  for i in $c
  do
        x=${file%.*}
	x="$x ($i).mov"
     	[[ -f $x ]] && check_file $file "$x"
  done
done

find /Users/oj/Photos_Backup -name "*.jpeg" | while read file; do

  for i in $c
  do
        x=${file%.*}
	x="$x ($i).mov"
     	[[ -f $x ]] && check_file $file "$x"
  done
done
   
