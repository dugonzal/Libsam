NAME := libsam.a

INCLUDE_FILES :=
INCLUDE_DIR := in
SRC_FILES := ft_strlen ft_strcpy ft_strcmp ft_write ft_read ft_strdup
SRC_DIR := src/






all: $(NAME)

clean:


fclean: clean

re: fclean

.PHONY: re
