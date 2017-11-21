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
    shellcodeTestFile=$currentFolder"/Shellcode-Injectable-Projectshellcode.c"
    shellcodeTestLine="4"
    shellcode_escaped=$( echo "$shellcode" | sed -e 's/[\/&]/\\&/g' )
    code="char code[] =\"$shellcode_escaped\";"

    sed -i "${shellcodeTestLine}s/.*/$code/" "$shellcodeTestFile"

    echo "Shellcode injected into "$currentFolder"/Shellcode-Injectable-Projectshellcode.c"
}

function buildShellcode {
    gcc $currentFolder"/Shellcode-Injectable-Projectshellcode.c" -o $currentFolder"/Shellcode-Injectable-Projectshellcode" -fno-stack-protector -z execstack -no-pie
    echo "Shellcode test program was build succesfuly into "$currentFolder"/Shellcode-Injectable-Projectshellcode"
}

function runShellcode {
    echo "Executing shellcode "$currentFolder"/Shellcode-Injectable-Projectshellcode"
    ./Shellcode-Injectable-Projectshellcode
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
    echo '    -e, --extract             Extract shellcode from binary file and print in console'
    echo '    -s, --save                Save shellcode string into a .txt file'
    echo '    -t, --test                Inject shellcode string into shellcode.c source code, ready to compile'
    echo '    -tb, --testbuild          Inject shellcode string and build shellcode.c'
    echo '    -tbr, --testbuildrun      Inject shellcode string, build shellcode.c and run program'
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
            break
        ;;
        # Save shellcode into shellcode.c file to test
        -t|--test)
            getShellcode
            injectShellcode
            break
        ;;
        -tb|--testbuild)
            getShellcode        
            injectShellcode
            buildShellcode
            break
        ;;
        -tbr|--testbuildrun)
            getShellcode       
            injectShellcode
            buildShellcode
            runShellcode
            break
        ;;
        *)
            printHelp
            break
        ;;
    esac
done