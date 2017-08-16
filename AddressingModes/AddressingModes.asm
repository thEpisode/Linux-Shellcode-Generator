; AddressingModes.asm
; x86 architecture
; Intel specification
section .data
    name db 'Zara Ali '

section .text
    global _start

_start:
    ;writing the name 'Zara Ali'
    mov	edx,9       ;message length
    mov	ecx, name   ;message to write
    mov	ebx,1       ;file descriptor (stdout)
    mov	eax,4       ;system call number (sys_write)
    int	0x80        ;call kernel

    mov	[name],  dword 'Nuha'    ; Changed the name to Nuha Ali

    ;writing the name 'Nuha Ali'
    mov	edx,8       ;message length
    mov	ecx,name    ;message to write
    mov	ebx,1       ;file descriptor (stdout)
    mov	eax,4       ;system call number (sys_write)
    int	0x80        ;call kernel

    mov	eax,1       ;system call number (sys_exit)
    int	0x80        ;call kernel