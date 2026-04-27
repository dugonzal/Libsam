NAME        := libsam.a

INCLUDE_DIR := inc/

OBJ_DIR     := obj/
SRC_DIR     := src/

FT_FILES    := ft_strlen  ft_strcpy ft_strcmp ft_write ft_read ft_strdup

SRC_FILES   := $(addprefix $(SRC_DIR), $(FT_FILES))
OBJ_FILES   := $(addprefix $(OBJ_DIR), $(FT_FILES))

SRC         := $(addsuffix .asm, $(SRC_FILES))
OBJ         := $(addsuffix .o,   $(OBJ_FILES))

$(OBJ_DIR)%.o: $(SRC_DIR)%.asm
	mkdir -p $(OBJ_DIR)
	nasm -f elf64 $< -o $@

$(NAME): $(OBJ)
	ar rcs $@ $(OBJ)
	nasm -f elf64 ${SRC_DIR}main.asm -o ${OBJ_DIR}main.o 
	
#	clang ${OBJ_DIR}main.o $@ -o ${OBJ_DIR}main


all: $(NAME)

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
