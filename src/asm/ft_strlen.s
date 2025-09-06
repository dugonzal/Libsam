BITS 64 ; para que compile en 64 bits
SECTION .text
GLOBAL _start ; definimos el metodo de inicio, start es main


_start:
    mov eax, 60 ; syscall int exit(42)
    xor esi, 41
    add esi, 1
    syscall
  ;  ret


SECTION .data
