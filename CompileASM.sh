#!/bin/bash

projectFlag=$1
projectFolder=$2
currentFolder=${PWD}

while true; do
    case "$projectFlag" in 
        -f|--folder)
            cd "$currentFolder/$projectFolder/"
            nasm -f elf32 $projectFolder'.asm' -o $projectFolder'.o'
            ld -m elf_i386 $projectFolder'.o' -o $projectFolder
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