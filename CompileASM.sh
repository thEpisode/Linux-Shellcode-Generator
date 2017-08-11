#!/bin/bash

flag=$1
projectFolder=$2
currentFolder=${PWD}

function compile {
    cd "$currentFolder/$projectFolder/"
    nasm -f elf32 $projectFolder'.asm' -o $projectFolder'.o'
    ld -m elf_i386 $projectFolder'.o' -o $projectFolder
    cd $currentFolder
}

function printHelp {
    echo
    echo 'Usage: bash CompileASM.sh [<options>] [<folder name>]'
    echo
    echo '    -h, --help                Show helps'
    echo '    -f, --folder              Compile .asm file inside folder'
    echo '        Disclaimer: This script works in current folder, do not try to compile outside this folder'
    echo
    echo 'Example:'
    echo '  > bash CompileASM.sh -f HelloWorld'
    echo
}

function printFinish {    
    echo 'Compilation done with 0 errors'
    echo 'Check $projectFolder folder'
    echo
}

while true; do
    case "$flag" in
        -h|--help)
            printHelp
            break
        ;;
        -f|--folder)
            compile
            printFinish
            break
        ;;
        *)
            printHelp
            break
        ;;
    esac
done
