NAME := libsam.a

INCLUDE_DIR := inc/
INCLUDE_FILES := libsam

SRC_DIR_OBJ := obj/

SRC_DIR := src/asm/

FT_FILES  := ft_strlen #ft_strcpy ft_strcmp ft_write ft_read ft_strdup

SRC_FILES += $(addprefix $(SRC_DIR), $(FT_FILES))
OBJ_FILES += $(addprefix $(SRC_DIR_OBJ), $(FT_FILES))

SRC = $(addsuffix .s, $(SRC_FILES))

OBJ = $(addsuffix .o, $(OBJ_FILES))


$(NAME): $(OBJS)
	nasm -f elf64 $(SRC) -o $@
	ld libsam.a -o libsam && ./libsam
	echo $?
	objdump -d libsam

all: $(NAME)

clean:
	rm -rf obj/

fclean: clean
	rm -rf libsam.a

re: fclean all

.PHONY: all clean clean re
