BITS 64

SECTION .data
SECTION .text
  GLOBAL ft_strdup

EXTERN malloc
EXTERN ft_strlen
EXTERN ft_strcpy

ft_strdup:
    push    r12
    mov     r12, rdi        ; guardamos s en r12 (sobrevive a calls)

    call    ft_strlen       ; rax = strlen(s), rdi sigue siendo s
    inc     rax             ; +1 para el '\0'
    
    mov     rdi, rax
    call    malloc wrt ..plt

    cmp     rax, 0
    je     end 

    mov     rdi, rax        ; dst = ptr nuevo
    mov     rsi, r12        ; src = s original

    mov     r12, rax

    call    ft_strcpy
    mov     rax, r12
    ret

end:
    pop     r12             ; restauramos r12
    ret
