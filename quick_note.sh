#!/usr/bin/env bash
## created on 2022-12-19
## https://github.com/thanasisn <natsisphysicist@gmail.com>

#### Create a quick note and get in the Notes dir.
## Run in terminal or as a key bind from sxhkd

## go to this folder at the end
NOTESDIR="$HOME/NOTES/00_INPUT"
mkdir -p "$NOTESDIR"
cd "$NOTESDIR" || exit

## file name for the note
newfile="${NOTESDIR}/Quick_Note_$(date +'%F_%H%M')"

## use the template script
"$HOME/CODE/notes_tools/new_note.sh" "$newfile"

## leave the shell in the current dir
$SHELL

