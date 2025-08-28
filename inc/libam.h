# ifndef LIBSAM_H
# define LIBSAM_H

int ft_strlen(char *str);
char *ft_strcpy(const char *dst, char *src);
char *ft_strdup(char *str);
void ft_write(int fd, const char *str, int len);
int ft_strcmp(const char *str1, const char *str2);
ssize_t read(int fd, void *buf, size_t count);

#endif






