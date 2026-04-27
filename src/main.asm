BITS 64

EXTERN ft_strlen
EXTERN ft_strcmp
EXTERN ft_strcpy
EXTERN ft_write
EXTERN ft_read
EXTERN ft_strdup

SECTION .data
  str: DB "osos", 0
  len: equ $ - str

  str2: DB "fin", 0
  len_str2: equ $ - str2

SECTION .text
  GLOBAL main 

main:
  call strlen 
  
  call strcmp
  ; cmp rax, 0
  ; jne strcmp_end

  call write
  ;
  jmp end

strlen:
  lea rdi, [rel str]
  call ft_strlen
  ret 

strcmp:
  lea rdi, [rel str]
  lea rsi, [rel str2]
  call ft_strcmp
  ret

strcmp_end:
  mov rdi, 1
  lea rsi, [rel str2]
  mov rdx, len_str2
  call ft_write
  mov rdi, 0
  ret

write:
  mov rdi, 1
  lea rsi, [rel str]
  mov rdx, len
  call ft_write
  mov rdi, 0
  ret

end:
  xor rdi, 0 
  mov rax, 60
  syscall
