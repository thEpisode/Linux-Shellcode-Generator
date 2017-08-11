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

> gcc cExecutableName.c -o cExecutableName -fno-stack-protector -z execstack -no-pie

## Binary to Shellcode string

To fast development in shellcodes use next following script to generate shellcode string and test

### Usage

    Usage: bash shellcode.sh [<options>] [<filename>]
    
        -e, --extract             Extract shellcode from binary and print
        -s, --save                Save shellcode into a .txt file
        -t, --test                Inject shellcode into shellcode.c file to test
        -tb, --testbuild          Inject shellcode and build shellcode.c file
        -tbr, --testbuildrun      Inject shellcode, buld and run shellcode.c file
    
    Example:
      > bash shellcode.sh -tbr ~/ASM/HelloWorld/Helloworld.asm

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