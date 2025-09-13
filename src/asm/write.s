BITS 64 ; para que compile en 64 bits
SECTION .text
;buffer: resb 64 ;
GLOBAL _start ; definimos el metodo de inicio, start es main


_start:
    mov rax, 60 ; syscall int exit(42)
    xor rdi, 10
    syscall
   ; ret


SECTION .data
