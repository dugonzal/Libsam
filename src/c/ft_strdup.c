# include "../../inc/libsam.h"

char *ft_strdup(const char *str) {
	size_t len = ft_strlen(str);
	int i = -1;

	char *tmp = (char *)malloc(sizeof(char) * len + 1);
	if (tmp == 0) return 0;

	while (++i < len)
		tmp[i] = str[i];
	tmp[i] = 0;

	return tmp;
}
