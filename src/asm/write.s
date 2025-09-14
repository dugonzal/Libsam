BITS 64 ; para que compile en 64 bits

SECTION .data
    msg db "", 20, 10
    len equ $ - msg

SECTION .text
GLOBAL _start ; definimos el metodo de inicio, start es main


ft_write:
    mov rax, 0 ; syscall int read(fd, char *, len)
    mov rdi, 0
    mov rsi, msg
    mov rdx, len
    syscall


    mov rax, 1 ; int write(fd, msg, len)
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    mov rax, 60 ;exit(rdi)
    xor rdi, rdi
    syscall


_start:
    call ft_write
