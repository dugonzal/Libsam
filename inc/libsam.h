# ifndef LIBSAM_H
# define LIBSAM_H

#include <stdio.h>
#include <stdlib.h>

size_t ft_strlen(const char *str);

char *ft_strcpy(const char *dst, char *src);

char *ft_strdup(const char *str);

void ft_write(int fd, const char *str, int len);

int ft_strcmp(const char *str1, const char *str2);

ssize_t read(int fd, void *buf, size_t count);

#endif






