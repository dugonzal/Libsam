BITS 64
SECTION .text
GLOBAL _start



_start:
    mov rax, 60
    xor rdi, 0
    syscall
    ret
SECTION .data
