BITS 64

SECTION .text

GLOBAL ft_strcmp

ft_strcmp:
    mov     rcx, 0                     ; i = 0

while:
    movzx   eax, byte [rdi + rcx]      ; eax = s1[i] (cero-extendido)
    movzx   edx, byte [rsi + rcx]      ; edx = s2[i]
    cmp     al, dl                     ; ¿iguales?
    jne     distintos                  ; no → restar y salir
    cmp     al, 0                      ; ¿fin de ambos strings?
    je      fin                        ; sí → iguales (rax = 0)
    inc     rcx
    jmp    while 

distintos:
    sub     eax, edx                   ; diferencia

fin:
    ret
