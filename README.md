# libsam

Reimplementación en ensamblador de seis funciones de la libc para el proyecto
**Libasm** de 42 Urduliz. ASM de 64 bits (NASM, sintaxis Intel), ABI System V
x86-64, sin una sola línea de C en la librería.

## Funciones

| Función | Origen |
|---|---|
| `ft_strlen` | `man 3 strlen` |
| `ft_strcpy` | `man 3 strcpy` |
| `ft_strcmp` | `man 3 strcmp` |
| `ft_write` | `man 2 write` |
| `ft_read` | `man 2 read` |
| `ft_strdup` | `man 3 strdup` (usa `malloc`) |

`ft_write` y `ft_read` devuelven `ssize_t` y dejan `errno` puesto cuando la
llamada al sistema falla. `ft_strdup` reserva con `malloc` y devuelve `NULL` si
la reserva falla.

## Estructura

```
inc/libsam.h        prototipos
src/ft_*.asm        las seis funciones (una por fichero)
src/main.c          driver de pruebas: 32 comprobaciones
Makefile
```

## Build

```sh
make        # genera libasm.a
make run    # compila src/main.c contra la librería y ejecuta las pruebas
make clean  # borra obj/
make fclean # borra obj/ y libasm.a
make re     # fclean + all
make push   # envía master al repositorio de la intra
```

Salida esperada:

```
TODO OK (0 fallos) [32 checks]
```

## Qué cubren las pruebas

Valor de retorno y contenido de cada función, terminación en NUL, que no se
escriba de más, destino desplazado, que `ft_strdup` devuelva un puntero distinto
y no comparta memoria con el original, lectura y escritura por `pipe`, y el caso
de descriptor inválido (`-1` con `errno == EBADF`).

Verificado en Ubuntu 22.04, Ubuntu 24.04 y Arch Linux, compilando el driver con
`clang` y con `gcc`, y enlazando PIE y estático. También con `valgrind`: 0 errores
y 0 fugas de memoria.

## Nota sobre la convención de llamada

La ABI exige `rsp % 16 == 0` justo antes de cada `call`. Un llamante escrito a
mano que no lo cumpla deja la pila desalineada y `malloc` revienta dentro de
glibc (su `movaps` sobre la pila exige dirección múltiplo de 16), con un
`SIGSEGV` que aparece señalando a `ft_strdup` aunque el fallo esté en el
llamante. Las seis funciones de esta librería lo respetan; el detalle está
documentado por si sirve de algo a quien se choque con lo mismo.

## Autor

Dugonzal — 42 Urduliz.
