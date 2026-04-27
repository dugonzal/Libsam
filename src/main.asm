section .data
msg db "hola mundo", 10, 0
len equ $ - msg - 1

section .bss
buf resb 100

section .text
global main

extern ft_strlen, ft_strcpy, ft_strcmp
extern ft_write, ft_read, ft_strdup

main:
    ; ---- write ----
    mov rdi, 1
    lea rsi, [rel msg]
    mov rdx, len
    call ft_write

    ; ---- strlen ----
    lea rdi, [rel msg]
    call ft_strlen

    ; ---- strdup ----
    lea rdi, [rel msg]
    call ft_strdup

    ; imprimir copia
    mov rdi, 1
    mov rsi, rax
    mov rdx, len
    call ft_write

    ; ---- read ----
    mov rdi, 0
    lea rsi, [rel buf]
    mov rdx, 10
    call ft_read

    ; imprimir lo leído
    mov rdi, 1
    lea rsi, [rel buf]
    mov rdx, rax
    call ft_write

    ; exit
    xor edi, edi
    mov eax, 60
    syscall
