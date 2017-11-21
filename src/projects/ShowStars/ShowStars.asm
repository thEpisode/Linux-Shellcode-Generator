; ShowStars.asm
; x86 architecture
; Intel specification
section .data
    msg db 'Displaying 9 stars',0xa ;a message
    len equ $ - msg  ;length of message
    s2 times 9 db '*'
    brkln db '', 0xa ; breakline
    brklen equ $ - brkln

section .text
    global _start

_start:
    mov	edx,len  ;message length
    mov	ecx,msg  ;message to write
    mov	ebx,1    ;file descriptor (stdout)
    mov	eax,4    ;system call number (sys_write)
    int	0x80     ;call kernel
        
    mov	edx,9    ;message length
    mov	ecx,s2   ;message to write
    mov	ebx,1    ;file descriptor (stdout)
    mov	eax,4    ;system call number (sys_write)
    int	0x80     ;call kernel

    mov edx, brklen;show a breakline
    mov ecx, brkln
    mov ebx, 1
    mov eax, 4
    int 0x80
        
    mov	eax,1    ;system call number (sys_exit)
    int	0x80     ;call kernel