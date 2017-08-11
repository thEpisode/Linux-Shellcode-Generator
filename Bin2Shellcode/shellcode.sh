#!/bin/bash

binaryFile=$1
saveInFile=$2

echo $binaryFile
echo $saveInFile

for i in $(objdump -d $binaryFile |grep "^ " |cut -f2); do echo -n '\x'$i; done;

# Get data from binary
for i in $(objdump -d $binaryFile |grep "^ " |cut -f2);do
    shellcode=$shellcode'\x'$i
done

echo 'Shellcode:'
echo $shellcode

while true; do
    case "$saveInFile" in 
        -s|--save)
            echo 'inside while and case'
            echo -n $shellcode >> shellcode.txt
        ;;
        *)
            break
        ;;
    esac
done

# Print in console
echo $shellcode