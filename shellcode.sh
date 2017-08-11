#!/bin/bash

binaryFile=$1
saveInFile=$2
currentFolder=${PWD}

# Get data from binary
for i in $(objdump -d $binaryFile |grep "^ " |cut -f2);do
    shellcode=$shellcode'\x'$i
done

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