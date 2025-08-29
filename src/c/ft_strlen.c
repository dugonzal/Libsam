# include "../../inc/libsam.h"

size_t ft_strlen(const char *str) {
	size_t i = -1;

	while (str[++i]);

	return i;
}
