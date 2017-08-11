# ASM

This is a series of experiments in C/ASM to execute shellcodes, I prefer Intel but if you found any code in AT&T code don't worry, only read documentation inside source code

All source codes run on Linux, I will try to test in some many distros

## Bin to shellcode string

Execute bash script in /Bin2Shellcode folder and pass the binary name

> bash shellcode.sh ~/ASM/FolderName/binaryName

## x86 support

### Compiling .asm source codes

> nasm -f elf sourceCode.asm
> ld -o executableName sourceCode.o

### Dissasembly to read hexadecimal code

> objdump -d executableName

### Compiling .c source codes

> gcc -o cExecutableName sourceCode.c