# ASM

This is a series of experiments in C/ASM to execute shellcodes, I prefer Intel but if you found any code in AT&T code don't worry, only read documentation inside source code

All source codes run on Linux, I will try to test in some many distros

## x86 support

### Compiling .asm source codes

> nasm -f elf sourceCode.asm
> ld -o executableName sourceCode.o

### Dissasembly to read hexadecimal code

> objdump -d executableName

### Compiling .c source codes

> gcc -o cExecutableName sourceCode.c

## ASM Fast Development Projects

I create a new strategy to fast development in asm, you could use it but you need to follow next instructions

### Creating new ASM Fast Development Projects

To create new project in ASM create a new folder named as you want and create a .asm file with same folder name. E.g.

> |- /
>    |- MyProject/
>        |- MyProject.asm

Develop all you needs

### Compiling ASM Fast Development Projects

If you have an ASM Fast Development Project to compile only needs run following bash command

> bash CompileASM.sh --folder MyProject

It generates .o file and executable file

## Bin to shellcode string

Execute bash script in /Bin2Shellcode folder and pass the binary name

> bash shellcode.sh ~/ASM/FolderName/binaryName