#!/bin/bash

binaryFile=$1
saveInFile=$2
currentFolder=${PWD}

function getShellcode {
    # Get data from binary
    for i in $(objdump -d $binaryFile |grep "^ " |cut -f2);do
        shellcode=$shellcode'\x'$i
    done
}

function saveShellcode {
    rm -f $binaryFile"_shellcode.txt"
    echo $shellcode >> $binaryFile"_shellcode.txt"
    echo "Shellcode save into "$binaryFile"_shellcode.txt"
}

function injectShellcode {
    shellcodeTestFile=$currentFolder"/ShellcodeTest/shellcode.c"
    shellcodeTestLine="1"
    shellcode_escaped=$( echo "$shellcode" | sed -e 's/[\/&]/\\&/g' )
    code="char code[] =\"$shellcode_escaped\";"

    sed -i "${shellcodeTestLine}s/.*/$code/" "$shellcodeTestFile"

    echo "Shellcode injected into "$currentFolder"/ShellcodeTest/shellcode.c"
}

function buildShellcode {
    gcc -o $currentFolder"/ShellcodeTest/shellcode" $currentFolder"/ShellcodeTest/shellcode.c"

    echo "Shellcode test program was build succesfuly into "$currentFolder"/ShellcodeTest/shellcode"
}

function runShellcode {
    echo "Executing shellcode "$currentFolder"/ShellcodeTest/shellcode"
    ./ShellcodeTest/shellcode
}

# Print in console
function printShellcode {
    echo
    echo 'Shellcode extracted: '
    echo
    echo $shellcode
    echo
}

function printHelp {
    echo
    echo 'Usage: bash shellcode.sh [<filename>] [<options>]'
    echo
    echo '    -s, --save                Save shellcode into a .txt file'
    echo '    -t, --test                Inject shellcode into shellcode.c file to test'
    echo '    -tb, --testbuild          Inject shellcode and build shellcode.c file'
    echo '    -tbr, --testbuildrun      Inject shellcode, buld and run shellcode.c file'
    echo
    echo 'Example:'
    echo '  > bash shellcode.sh ~/ASM/HelloWorld/Helloworld.asm -tbr'
}

while true; do
    case "$saveInFile" in 
        -h|--help)
            printHelp
            break
        ;;
        # Save shellcode into a .txt file
        -s|--save)
            saveShellcode
            printShellcode            
            break
        ;;
        # Save shellcode into shellcode.c file to test
        -t|--test)
            getShellcode      
            injectShellcode
            printShellcode
            break
        ;;
        -tb|--testbuild)
            getShellcode        
            injectShellcode
            buildShellcode
            printShellcode
            break
        ;;
        -tbr|--testbuildrun)
            getShellcode       
            injectShellcode
            buildShellcode
            runShellcode
            printShellcode
            break
        ;;
        *)
            getShellcode
            printShellcode
            break
        ;;
    esac
done