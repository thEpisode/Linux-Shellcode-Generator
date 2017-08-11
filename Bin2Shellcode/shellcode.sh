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

while test $# -gt 0; do
    case saveInFile in 
        -s|--save)
            echo -n $shellcode >> shellcode.txt
    esac
done

# Print in console
echo -n $shellcode