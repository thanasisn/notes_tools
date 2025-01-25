#!/usr/bin/env bash
## created on 2025-01-25

#### Move a file to an archive folder
## The idea is to create a daily history of files copies

file="$1"
folder="$2"

if [ "$#" -ne 2 ]; then
    echo "Needs two arguments: <file> <target path>"
    exit 1
fi

if [ -f "$file" ] ; then
  echo "File  : $file"
else
  echo "NOT a file: $file"
  exit 2
fi

if [ -d "$folder" ] ; then
  echo "Folder: $folder"
else
  echo "NOT a folder: $folder"
  exit 3
fi

file="$(basename "${file}")"
target="$folder/$(date +"%Y")/${file%.*}_$(date +"%Y-%m-%d").${file##*.}"

echo "Target: $target"

## create target folder
mkdir -p "$folder/$(date +"%Y")"
## move file there
#cp --update

echo "$file" "$target"

exit 0
