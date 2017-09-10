#!/bin/bash

if [ "$1" == '' ]; then
 echo "Usage <script-name> <directory>";
 echo "directory: the directory you want to rename PDFs named by old script"
 exit 0;
fi

directory=$1;

echo "Running the Renamer on $directory";

find $directory -iname '*.pdf' | grep -i "compressed-" | while read f
do
 # Looping on all files in the directory which have not been tagged in the past.
 newfilename=`echo "$f" | sed s/compressed-// | sed s/\.pdf$/\.compressed\.pdf/`
 echo "Renaming file from $f to $newfilename"
 mv "$f" "$newfilename"
done

find $directory -iname '*.pdf' | grep -i "toosmall-" | while read f
do
 # Looping on all files in the directory which have not been tagged in the past.
 newfilename=`echo "$f" | sed s/toosmall-// | sed s/\.pdf$/\.toosmall\.pdf/`
 echo "Renaming file from $f to $newfilename"
 mv "$f" "$newfilename"
done

find $directory -iname '*.pdf' | grep -i "passprotected-" | while read f
do
 # Looping on all files in the directory which have not been tagged in the past.
 newfilename=`echo "$f" | sed s/passprotected-// | sed s/\.pdf$/\.passprotected\.pdf/`
 echo "Renaming file from $f to $newfilename"
 mv "$f" "$newfilename"
done
