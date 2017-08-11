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
            local file=$currentFolder"/ShellcodeTest/shellcode.c"
            local line_num="1"
            local replacement='char code[] = "$shellcode"';

            replacement_escaped=$( echo "$replacement" | sed -e 's/[\/&]/\\&/g' )
            sed -i "${line_num}s/.*/$replacement_escaped/" "$file"
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