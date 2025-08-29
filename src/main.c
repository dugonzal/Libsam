# include "../inc/libsam.h"


int main(int ac, const char **av, const char **) {
	if (ac != 2) return 1;

	size_t i = ft_strlen(av[1]);
	char *str = ft_strdup(av[1]);

	printf("size ->: {%lu} | str ->: {%s}", i, str);

	free(str);
	exit(0);
}
