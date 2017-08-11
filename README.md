# ASM

This is a series of experiments in ASM to execute shellcodes with C, I prefer Intel syntax but if you found any code in AT&T code don't worry, only read documentation inside source code

All source codes run on Linux, I will try to test in some many distros

## x86 support

### Compiling .asm source codes

> nasm -f elf sourceCode.asm

> ld -o executableName sourceCode.o

### Dissasembly to read hexadecimal code

> objdump -d executableName

### Compiling .c source codes

Normal purposes

> gcc -o cExecutableName sourceCode.c

Testing shellcodes

> gcc -fno-stack-protector -z execstack cExecutableName.c -o cExecutableName

## Binary to Shellcode string

To fast development in shellcodes use next following script to generate shellcode string

### Usage

> bash shellcode.sh [filename] [-s --save | optional]

### Show in console

> bash shellcode.sh ~/ASM/FolderName/binaryName

### Save in txt file

> bash shellcode.sh ~/ASM/FolderName/binaryName --save

or

> bash shellcode.sh ~/ASM/FolderName/binaryName -s

### Testing in C program

If you want to run in a C program but not want to compile, using next flag you can replace in ShellcodeTest/shellcode.c the payload

> bash shellcode.sh ~/ASM/FolderName/binaryName --test

or 

> bash shellcode.sh ~/ASM/FolderName/binaryName -t

### Testing and compiling in C program

Similar to last option but this compile the program

> bash shellcode.sh ~/ASM/FolderName/binaryName --testbuild

or 

> bash shellcode.sh ~/ASM/FolderName/binaryName -tb

### Testing, compiling and run in C program

Similar to last option but this execute the program

> bash shellcode.sh ~/ASM/FolderName/binaryName --testbuildrun

or 

> bash shellcode.sh ~/ASM/FolderName/binaryName -tbr

## ASM Fast Development Projects (X86)

I create a new strategy to fast development in asm, you could use it but you need to follow next instructions:

### Creating new ASM Fast Development Projects

To create new project in ASM create a new folder named as you want and create a .asm file with same folder name. E.g.

    | ~/ASM/
        |- MyProject/
            |- MyProject.asm

Develop all you needs into .asm file

### Compiling ASM Fast Development Projects

If you have an ASM Fast Development Project to compile only needs run following bash command

> bash CompileASM.sh --folder MyProject

It generates:

    | ~/ASM/
        |- MyProject/
            |- MyProject.asm
            |- MyProject.o
            |- MyProject [Executable file]