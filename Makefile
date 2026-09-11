NAME        := libasm.a

INC_DIR     := inc/
SRC_DIR     := src/
OBJ_DIR     := obj/

FT_FILES    := ft_strlen ft_strcpy ft_strcmp ft_write ft_read ft_strdup
ASM_SRC     := $(addprefix $(SRC_DIR), $(addsuffix .asm, $(FT_FILES)))
ASM_OBJ     := $(addprefix $(OBJ_DIR), $(addsuffix .o,   $(FT_FILES)))

MAIN_SRC    := $(SRC_DIR)main.c
MAIN_BIN    := $(OBJ_DIR)main

all: $(NAME)

$(NAME): $(ASM_OBJ)
	ar rcs $@ $(ASM_OBJ)

$(OBJ_DIR)%.o: $(SRC_DIR)%.asm
	@mkdir -p $(OBJ_DIR)
	nasm -f elf64 $< -o $@

run: $(NAME) $(MAIN_BIN)
	./$(MAIN_BIN)

$(MAIN_BIN): $(MAIN_SRC) $(NAME)
	@mkdir -p $(OBJ_DIR)
	clang -Wall -Wextra -I$(INC_DIR) $(MAIN_SRC) $(NAME) -o $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all run clean fclean re
