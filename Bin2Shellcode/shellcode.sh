#!/bin/bash

binaryFile=$1
saveInFile=$2

# Get data from binary
for i in $(objdump -d $binaryFile |grep "^ " |cut -f2);do
    shellcode=$shellcode'\x'$i
done

# Read if exist -s or --save parameter and save result into file
while true; do
    case "$saveInFile" in 
        -s|--save)
            rm -f shellcode.txt
            echo $shellcode >> shellcode.txt
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