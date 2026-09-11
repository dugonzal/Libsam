GLOBAL ft_write
EXTERN __errno_location

SECTION .data

SECTION .text
  GLOBAL ft_write

ft_write:
    mov     rax, 1
    syscall
    cmp     rax, 0
    jl      error
    ret

error:
    neg     rax                      ; errno positivo
    mov     r10, rax                 ; guardar (r10 = scratch)
    call    __errno_location wrt ..plt  ; rax = &errno del hilo
    mov     [rax], r10d              ; *errno = código (32 bits)
    mov     rax, -1
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
