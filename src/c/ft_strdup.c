# include "../../inc/libsam.h"

char *ft_strdup(const char *str) {
	size_t len = ft_strlen(str);

	char *tmp = (char *)malloc(sizeof(char) * len + 1);
	if (tmp == NULL) return NULL;

	for (int i = 0; i < len; i++) {
		tmp[i] = str[i];
	}
	return tmp;
}
