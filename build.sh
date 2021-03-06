#!/bin/bash
result=${PWD##*/}
export GOARCH=amd64
fn="${1:-$result}"
filename=$(basename "$fn")
extension="${filename##*.}"
filename="${filename%.*}"
env GOOS=windows go test "$1"
env GOOS=linux go test "$1"
env GOOS=darwin go test "$1"
env GOOS=windows go build -a -o "$filename"_win-"$GOARCH".exe "$1"
env GOOS=linux go build -a -o "$filename"_linux-"$GOARCH" "$1"
env GOOS=darwin go build -a -o "$filename"_darwin-"$GOARCH" "$1"
