#!/bin/bash

if [ "$1" == '' ]; then
 echo "Usage <script-name> <directory> <threshhold_in_bytes>";
 echo "directory: the directory you want to compress PDFs"
 echo "threshhold_in_bytes: The threshhold of file size ABOVE which compression should run. "
 echo "                     Suggested value is 100000 (~ 100Kb). ANything smaller and compression has little or even negative effect. "
 exit 0;
fi

if [ "$2" == '' ]; then
 echo "Usage <script-name> <directory> <threshhold_in_bytes>";
 echo "directory: the directory you want to compress PDFs"
 echo "threshhold_in_bytes: The threshhold of file size ABOVE which compression should run. "
 echo "                     Suggested value is 100000 (~ 100Kb). ANything smaller and compression has little or even negative effect. "
 exit 0;
fi

directory=$1;
thresh=$2;

echo "Running the Compressor on $directory and $thresh";

echo "Cleaning up ._ files - they are an irritant at many levels";
find $directory -name ._\* -delete

find $directory -iname *.pdf | grep -v -i compressed | grep -v passprotected | grep -v toosmall | while read f
do
    # Looping on all files in the directory which have not been tagged in the past.

 # Get Directory where the file is located
 subdir=`dirname "$f"`
 # Get The filename in that directory. Prefixes can be added to this.
 filename=`basename "$f"`
 # Get size of the file.
 s=`stat -c%s "$f"`

 if [ $s -gt $thresh ]; then
  # File is big enough to be considered for Compressing

  # Check if the file is password protected
  output=`gs -dBATCH -sNODISPLAY "$f" 2>&1`
  gsexit=$?

  # CAUTION:
  # There is a chance that gsexit is non-zero for other reasons too - like format error etc.
  # This script will still mark it as Password Protected.

  if [ "$gsexit" == "0" ]; then
   # Normal File
   newfilename=`echo "$f" | sed s/\.pdf$/\.compressed\.pdf/I`

   # The following command will create a compressed file, then delete the original if the first operation succeeded
   # And echos the fact that both commands were successful.

   gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$newfilename" "$f" && rm "$f" && echo "Compressed into $newfilename";
  else
   # Tag the password protected file so we can ignore it in future.
   echo "Renaming Encrypted File $f"
   newfilename=`echo "$f" | sed s/\.pdf$/\.passprotected\.pdf/I`
   mv "$f" "$newfilename"
  fi
 else
  # Tag files too small so we can ignore it in future

  echo "Renaming Too-Small File $f"
  newfilename=`echo "$f" | sed s/\.pdf$/\.toosmall\.pdf/I`
  mv "$f" "$newfilename"
 fi
done
