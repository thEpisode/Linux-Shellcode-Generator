#!/bin/bash

binaryFile=$1
saveInFile=$2


# Get data from binary
for i in $(objdump -d $binaryFile |grep "^ " |cut -f2);do
    shellcode=$shellcode'\x'$i
done

while test $# -gt 0; do
    case saveInFile in 
        -s|--save)
            echo -n $shellcode >> shellcode.txt
    esac
done

# Print in console
echo -n $shellcode