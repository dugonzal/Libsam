BITS 64

SECTION .data

SECTION .text
  GLOBAL ft_strcpy

ft_strcpy:
    mov     rax, rdi         ; preservamos dst (lo devolveremos)
    mov     rcx, 0
while:
    mov     dl, [rsi + rcx]  ; dl = src[i]
    mov     [rdi + rcx], dl
    cmp     dl, 0
    je      end
    inc     rcx
    jmp    while 

end:
    ret
