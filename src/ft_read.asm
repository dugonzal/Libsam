BITS 64

EXTERN __errno_location

SECTION .data
SECTION .text
  GLOBAL ft_read

ft_read:
    mov     rax, 0 
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
