; HelloWorld.asm
; x86 architecture
; Intel specification

section .data
    msg db "Hello world from Assembly!",0xA,0xD
    len equ $ - msg

section .text
    global _start

_start:

    mov eax, 4  ; ssize_t sys_write(unsigned int fd, const char * buf, size_t count) (write in console)
    mov ebx, 1  ; sys_write argv #1 (unsigned int), file descriptor (stdout)
    mov ecx, msg; sys_write argv #2 (char *), message to write
    mov edx, len; sys_write argv #3 (size_t), message length
    int 0x80    ; interrumpt system (call kernel)

    mov eax, 1  ; sys_exit
    int 0x80    ; call kernel