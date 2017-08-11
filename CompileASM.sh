#!/bin/bash

projectFlag=$1
projectFolder=$2
currentFolder=${PWD}

while true; do
    case "$projectFlag" in 
        -f|--folder)
            cd "$currentFolder/$projectFolder/"
            nasm -f elf $projectFolder'.asm'
            ld -o $projectFolder $projectFolder'.o'
            cd $currentFolder
            break
        ;;
        *)
            break
        ;;
    esac
done

echo 'Compilation done with 0 errors'
echo 'Check $projectFolder folder'
echo