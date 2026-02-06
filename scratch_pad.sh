#!/usr/bin/env bash
## https://github.com/thanasisn <natsisphysicist@gmail.com>

#### Just create a new md file with the current date
## This is to create a quick note

stamp="$(date +"%s")"

filename="$1"

stamp="$(date +"%s")"
datestr="$(date    -d@"${stamp}" +"%F %T %:z")"
dateUTC="$(date -u -d@"${stamp}" +"%F %T %:z")"

## open existing file
if [[ ! -f "$filename" ]] ; then
    echo "File no existing file $filename"
    echo "exit!!"
    exit 0
fi




