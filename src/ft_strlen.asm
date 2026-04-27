BITS 64

SECTION .data
SECTION .text
  GLOBAL ft_strlen


ft_strlen:
    mov rax, 0

while:
    cmp    byte [rdi + rax], 0 ; buscamos '\0'
    je     end 
    inc    rax                 ; contador++
    jmp    while 

end:
    ret

