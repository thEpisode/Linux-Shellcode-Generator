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

To easy extracting shellcodes use following script to generate shellcode strings and tests

### Usage

    Usage: bash shellcode.sh [<options>] [<filename>]
    
        -e, --extract             Extract shellcode from binary and print
        -s, --save                Save shellcode into a .txt file
        -t, --test                Inject shellcode into shellcode.c source code, ready to compile
        -tb, --testbuild          Inject shellcode and build C program
        -tbr, --testbuildrun      Inject shellcode, build and run C program
    
    Example:
      > bash shellcode.sh -tbr ~/ASM/HelloWorld/Helloworld.asm

## ASM Fast Development Projects (X86)

For fast development in asm, you could use following tool:

### Usage

    Usage: bash ASMFastDevelopment.sh [<options>] [<folder name>]
    
        -h, --help                Show helps'
        -n, --new                 Create new project with folder name given
        -c, --compile             Compile .asm file inside folder
                                  Disclaimer: This script works in current folder, do not try to compile outside this folder
    
    Example:
      > bash ASMFastDevelopment.sh -c HelloWorld
    

### Creating new ASM Fast Development Projects

> bash ASMFastDevelopment.sh --new HelloWorld

This command create a new .asm file inside folder, open and develop!

It generates:

    | ~/ASM/
        |- HelloWorld/
            |- HelloWorld.asm

**Disclaimer**: Do not change the .asm file name!. If you need change it, **you need to change folder name**

### Compiling ASM Fast Development Projects

> bash ASMFastDevelopment.sh --compile HelloWorld

It generates:

    | ~/ASM/
        |- HelloWorld/
            |- HelloWorld.asm
            |- HelloWorld.o
            |- HelloWorld [Executable file]