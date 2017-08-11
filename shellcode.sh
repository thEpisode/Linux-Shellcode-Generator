#!/bin/bash

binaryFile=$1
saveInFile=$2
currentFolder=${PWD}

# Get data from binary
for i in $(objdump -d $binaryFile |grep "^ " |cut -f2);do
    shellcode=$shellcode'\x'$i
done

# Read if exist -s or --save parameter and save result into file
while true; do
    case "$saveInFile" in 
        -s|--save)
            rm -f shellcode.txt
            echo $shellcode >> $binaryFile"_shellcode.txt"
            break
        ;;
        -t|--test)
            shellcodeTestFile=$currentFolder"/ShellcodeTest/shellcode.c"
            shellcodeTestLine="1"
            shellcode_escaped=$( echo "$shellcode" | sed -e 's/[\/&]/\\&/g' )

            code="char code[] =\"$shellcode_escaped\";"
            echo "code:"
            echo $code
            echo "replacement_escaped:"
            echo $shellcode_escaped
            
            sed -i "${shellcodeTestLine}s/.*/$code/" "$shellcodeTestFile"
            break
        ;;
        *)
            break
        ;;
    esac
done

# Print in console
echo
echo 'Shellcode: '
echo
echo $shellcode
echo