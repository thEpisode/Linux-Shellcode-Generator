#!/bin/bash

flag=$1
binaryFile=$2
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
    shellcodeTestLine="4"
    shellcode_escaped=$( echo "$shellcode" | sed -e 's/[\/&]/\\&/g' )
    code="char code[] =\"$shellcode_escaped\";"

    sed -i "${shellcodeTestLine}s/.*/$code/" "$shellcodeTestFile"

    echo "Shellcode injected into "$currentFolder"/ShellcodeTest/shellcode.c"
}

function buildShellcode {
    gcc -fno-stack-protector -z execstack $currentFolder"/ShellcodeTest/shellcode.c" -o -o $currentFolder"/ShellcodeTest/shellcode"

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
    echo 'Usage: bash shellcode.sh [<options>] [<filename>]'
    echo
    echo '    -e, --extract             Extract shellcode from binary and print'
    echo '    -s, --save                Save shellcode into a .txt file'
    echo '    -t, --test                Inject shellcode into shellcode.c file to test'
    echo '    -tb, --testbuild          Inject shellcode and build shellcode.c file'
    echo '    -tbr, --testbuildrun      Inject shellcode, buld and run shellcode.c file'
    echo
    echo 'Example:'
    echo '  > bash shellcode.sh -tbr ~/ASM/HelloWorld/Helloworld.asm'
    echo
}

while true; do
    case "$flag" in 
        -h|--help)
            printHelp
            break
        ;;
        -e|--extract)
            getShellcode
            printShellcode
            break
        ;;
        # Save shellcode into a .txt file
        -s|--save)
            getShellcode
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