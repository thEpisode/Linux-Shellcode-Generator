; hello.asm
; x86 architecture
; Intel specification

section .data
    msg db "Hello world from Assembly!",0xA,0xD
    len equ $ - msg

section .text
    global _start

_start:

    xor eax, eax    ;clean up the registers to avoid generating nulls
    xor ebx, ebx
    xor edx, edx
    xor ecx, ecx

    ; Using 4 bits registers because 8 bits are unused

    mov al, 4  ; ssize_t sys_write(unsigned int fd, const char * buf, size_t count) (write in console)
    mov bl, 1  ; sys_write argv #1 (unsigned int)
    mov cl, msg; sys_write argv #2 (char *)
    mov dl, len; sys_write argv #3 (size_t)
    int 0x80   ; interrumpt system (execute)

    xor eax, eax
    mov al, 1  ; sys_exit
    xor ebx,ebx
    int 0x80