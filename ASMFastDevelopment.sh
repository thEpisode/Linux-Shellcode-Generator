#!/bin/bash

flag=$1
projectFolder=$2
currentFolder=${PWD}

function newProject {
    mkdir "$currentFolder/$projectFolder/"
    echo "; hello.asm" >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "; x86 architecture" >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "; Intel specification" >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "section .data" >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "  " >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "" >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "section .text" >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "    global _start" >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "" >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "_start:" >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "  " >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "  " >> "$currentFolder/$projectFolder/$projectFolder.asm"
    echo "  " >> "$currentFolder/$projectFolder/$projectFolder.asm"
}

function compile {
    cd "$currentFolder/$projectFolder/"
    nasm -f elf32 $projectFolder'.asm' -o $projectFolder'.o'
    ld -m elf_i386 $projectFolder'.o' -o $projectFolder
    cd $currentFolder
}

function printHelp {
    echo
    echo 'Usage: bash ASMFastDevelopment.sh [<options>] [<folder name>]'
    echo
    echo '    -h, --help                Show helps'
    echo '    -n, --new                 Create new project with folder name given'
    echo '    -c, --compile             Compile .asm file inside folder'
    echo '        Disclaimer: This script works in current folder, do not try to compile outside this folder'
    echo
    echo 'Example:'
    echo '  > bash CompileASM.sh -c HelloWorld'
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
        -n|--new)
            newProject 
            break
        ;;
        -c|--compile)
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
