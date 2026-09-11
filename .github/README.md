# libsam

[English](README.md) | [Español](README.es.md)

Reimplementation in assembly of six libc functions for the **Libasm** project at
42 Urduliz. 64-bit ASM (NASM, Intel syntax), System V AMD64 ABI, not a single
line of C inside the library.

## Functions

| Function | Origin |
|---|---|
| `ft_strlen` | `man 3 strlen` |
| `ft_strcpy` | `man 3 strcpy` |
| `ft_strcmp` | `man 3 strcmp` |
| `ft_write` | `man 2 write` |
| `ft_read` | `man 2 read` |
| `ft_strdup` | `man 3 strdup` (calls `malloc`) |

`ft_write` and `ft_read` return `ssize_t` and set `errno` when the syscall fails.
`ft_strdup` allocates with `malloc` and returns `NULL` if the allocation fails.

## Layout

```
inc/libsam.h        prototypes
src/ft_*.asm        the six functions, one file each
src/main.c          test driver: 32 checks
Makefile
Dockerfile          verification on Ubuntu, the grader's OS
```

## Build

```sh
make        # builds libasm.a
make run    # compiles src/main.c against the library and runs the tests
make clean  # removes obj/
make fclean # removes obj/ and libasm.a
make re     # fclean + all
make push   # pushes master to the 42 intra repository
```

Expected output:

```
TODO OK (0 fallos) [32 checks]
```

## Verification on Ubuntu (Docker)

Ubuntu is stricter than Arch, so the project ships a container that runs the
tests on it. The image build itself fails if the tests fail.

```sh
docker build -t libsam .
docker run --rm libsam

# against the other Ubuntu release:
docker build --build-arg UBUNTU_VERSION=24.04 -t libsam:24.04 .
docker run --rm libsam:24.04
```

## What the tests cover

Return values and contents, NUL termination, no writing past the end, shifted
destination, that `ft_strdup` returns a different pointer and shares no memory
with the original, read/write through a `pipe`, and the invalid-descriptor case
(`-1` with `errno == EBADF`).

Verified on Ubuntu 22.04, Ubuntu 24.04 and Arch Linux, building the driver with
both `clang` and `gcc`, linked as PIE and static. Also under `valgrind`: no
errors, no leaks.

## A note on the calling convention

The ABI requires `rsp % 16 == 0` right before every `call`. A hand-written caller
that does not keep it aligned leaves the stack 8 bytes off, and `malloc` then
crashes inside glibc (its `movaps` on the stack requires a 16-byte aligned
address) with a `SIGSEGV` that points at `ft_strdup`, even though the bug is in
the caller. All six functions in this library keep it aligned; the detail is
written down here in case it saves someone else the headache.

## Author

Dugonzal — 42 Urduliz.
