#!/bin/bash

binaryFile=$1
saveInFile=$2
currentFolder=${PWD}

# Get data from binary
for i in $(objdump -d $binaryFile |grep "^ " |cut -f2);do
    shellcode=$shellcode'\x'$i
done

while true; do
    case "$saveInFile" in 
        # Save shellcode into a .txt file
        -s|--save)
            
            saveShellcode

            printShellcode
            
            break
        ;;
        # Save shellcode into shellcode.c file to test
        -t|--test)
            
            injectShellcode

            printShellcode

            break
        ;;
        -tb|--testbuild)
            
            injectShellcode

            buildShellcode

            printShellcode

            break
        ;;
        -tbr|--testbuildrun)
            
            injectShellcode

            buildShellcode

            runShellcode

            printShellcode

            break
        ;;
        *)
            printShellcode
            break
        ;;
    esac
done

function saveShellcode {
    rm -f shellcode.txt
    echo $shellcode >> $binaryFile"_shellcode.txt"
}

function injectShellcode {
    shellcodeTestFile=$currentFolder"/ShellcodeTest/shellcode.c"
    shellcodeTestLine="1"
    shellcode_escaped=$( echo "$shellcode" | sed -e 's/[\/&]/\\&/g' )
    code="char code[] =\"$shellcode_escaped\";"

    sed -i "${shellcodeTestLine}s/.*/$code/" "$shellcodeTestFile"
}

function buildShellcode {
    gcc -o $currentFolder"/ShellcodeTest/shellcode" $currentFolder"/ShellcodeTest/shellcode.c"
}

function runShellcode {
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