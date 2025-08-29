NAME := libsam.a

INCLUDE_FILES := libsam
INCLUDE_DIR := inc

SRC_FILES := ft_strlen ft_strcpy ft_strcmp ft_write ft_read ft_strdup

SRC_DIR_C := src/c
SRC_DIR_ASM := src/asm




asm:

c:

all: $(NAME)

clean:
	rm -rf obj/

fclean: clean
	rm -rf libsam.a

re: fclean
 
.PHONY: all clean clean re
