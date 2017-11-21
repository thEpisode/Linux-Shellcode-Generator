# Linux Shellcode Generator

This is a shellcode generator in ASM to fast development and test it in a C snippet template, I prefer Intel syntax but if you found any AT&T syntax in experiments code don't worry, only read documentation inside source code.

All source codes run on Debian, I will try to test in some many Linux distros.

## Table of contents
- [Manual compilation and test](#manual-compilation-and-test)
    * [x86 support](#x86-support)
		* [Compiling .asm source codes](#compiling-.asm-source-codes)
		* [Dissasembly compiled to read hexadecimal code](#dissasembly-compiled-to-read-hexadecimal-code)
		* [Compiling .c source codes](#compiling-.c-source-codes)
- [Binary to Shellcode string tool](#binary-to-shellcode-string-tool)
	* [shellcode.sh Usage](#shellcode.sh-usage)
- [ASM Fast Development Projects](#asm-fast-development-projects)
	* [ASM Fast Development Usage](#asm-fast-development-usage)
	* [Creating new ASM Fast Development Projects](#creating-new-asm-fast-development-projects)
	* [Compiling ASM Fast Development Projects](#compiling-asm-fast-development-projects)

## Manual compilation and test

If you want to compile and create a trace of all your code use the traditional steps. I know this is hard to remember, use the next snippets.

### x86 support

**Disclaimer:** This section is under x86 support, all code above is **only** for x86 architectures. In next versions support x64 and x84_64.

#### Compiling .asm source codes

> nasm -f elf sourceCode.asm

> ld -o executableName sourceCode.o

#### Dissasembly compiled to read hexadecimal code

> objdump -d executableName

#### Compiling .c source codes

Normal purposes

> gcc -o cExecutableName sourceCode.c

Testing shellcodes

> gcc cExecutableName.c -o cExecutableName -fno-stack-protector -z execstack -no-pie

## Binary to Shellcode string tool

To easy extracting shellcodes use shellcode.sh script contained in root project folder to generate shellcode strings and test it. You can extract a shellcode and print in console, save in a text file, inject into test project, build to check errors and run injected shellcode. Documentation is exposed below.

### shellcode.sh Usage:

    > bash shellcode.sh [<options>] [<asm_filename>]
    
        -e, --extract             Extract shellcode from binary file and print in console
        -s, --save                Save shellcode string into a .txt file
        -t, --test                Inject shellcode string into shellcode.c source code, ready to compile
        -tb, --testbuild          Inject shellcode string and build shellcode.c
        -tbr, --testbuildrun      Inject shellcode string, build shellcode.c and run program
    
    Example:
      > bash shellcode.sh -tbr ~/ASM/HelloWorld/Helloworld.asm

## ASM Fast Development Projects

I know that start a new project and contain all generated files is hard, for that reason I developed another tool for fast development in asm, you could create new projects with folder structure and using the [shellcode script](#binary-to-shellcode-string-tool) to compile and test use following tool:

**Disclaimer:** This section is under x86 support, all code above is **only** for x86 architectures. In next versions support x64 and x84_64.

### ASM Fast Development Usage

    > bash ASMFastDevelopment.sh [<options>] [<folder name>]
    
        -h, --help                Show helps'
        -n, --new                 Create new project with folder name given
        -c, --compile             Compile .asm file inside folder
                                  Disclaimer: This script works in current folder, do not try to compile outside this folder
    
    Example:
      > bash ASMFastDevelopment.sh -c HelloWorld
    

### Creating new ASM Fast Development Projects

> bash ASMFastDevelopment.sh --new HelloWorld

The previous command create a new .asm file inside a folder with name provided, open it and develop!

Folder tree generated:

    | ~/Linux-Shellcode-Generator/
		|- src/
			|- projects/
				|- HelloWorld/
					|- HelloWorld.asm

**Warning**: Do not change the .asm file name!. If you need change it, **you need to change folder name**

### Compiling ASM Fast Development Projects

> bash ASMFastDevelopment.sh --compile HelloWorld

The previous command generate:

    | ~/Linux-Shellcode-Generator/
		|- src/
			|- projects/
				|- HelloWorld/
					|- HelloWorld.asm
					|- HelloWorld.o
					|- HelloWorld [your executable file]

## Small help

<img src="http://i.imgur.com/ZPYfZty.png" alt="Registers" width="50%" style="display: block; margin: 0 auto;">
