#include "libsam.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>


static int	g_ok;
static int	g_ko;

static void	check(const char *fn, int cond, const char *msg) {
	if (cond)
		g_ok++;
	else {
		g_ko++;
		printf("KO  %-10s %s\n", fn, msg);
	}
}

static void	test_strlen(void) {
	char	big[512];

	check("ft_strlen", ft_strlen("") == 0, "cadena vacia != 0");
	check("ft_strlen", ft_strlen("hola") == 4, "'hola' != 4");
	memset(big, 'x', sizeof(big) - 1);
	big[sizeof(big) - 1] = '\0';
	check("ft_strlen", ft_strlen(big) == sizeof(big) - 1, "511 chars");
	check("ft_strlen", ft_strlen(big) == strlen(big), "difiere de libc");
}

static void	test_strcpy(void) {
	char	dst[64];
	char	off[8] = "XXXXXXX";

	memset(dst, 'Z', sizeof(dst));
	check("ft_strcpy", ft_strcpy(dst, "hola mundo") == dst, "no devuelve dst");
	check("ft_strcpy", strcmp(dst, "hola mundo") == 0, "contenido distinto");
	check("ft_strcpy", dst[10] == '\0', "falta el NUL");
	check("ft_strcpy", dst[11] == 'Z', "escribe de mas");
	ft_strcpy(off + 3, "ab");
	check("ft_strcpy", memcmp(off, "XXXab", 5) == 0, "dst desplazado");
}

static void	test_strcmp(void)
{
	check("ft_strcmp", ft_strcmp("abc", "abc") == 0, "iguales != 0");
	check("ft_strcmp", ft_strcmp("abc", "abd") < 0, "menor no da < 0");
	check("ft_strcmp", ft_strcmp("abd", "abc") > 0, "mayor no da > 0");
	check("ft_strcmp", ft_strcmp("", "a") < 0, "vacio vs 'a'");
	check("ft_strcmp", ft_strcmp("a", "") > 0, "'a' vs vacio");
	check("ft_strcmp", ft_strcmp("abc", "abcd") < 0, "prefijo");
	check("ft_strcmp", ft_strcmp("", "") == 0, "dos vacias");
}

static void	test_strdup(void) {
	const char	*src = "hola mundo";
	char		*dup;
	char		*empty;

	dup = ft_strdup(src);
	check("ft_strdup", dup != NULL, "devuelve NULL");
	if (dup)
	{
		check("ft_strdup", dup != src, "mismo puntero (no copia)");
		check("ft_strdup", strcmp(dup, src) == 0, "contenido distinto");
		check("ft_strdup", dup[10] == '\0', "falta el NUL");
		dup[0] = 'H';
		check("ft_strdup", src[0] == 'h', "comparte memoria con el original");
		free(dup);
	}
	empty = ft_strdup("");
	check("ft_strdup", empty != NULL && empty[0] == '\0', "cadena vacia");
	free(empty);
}

static void	test_write(void) {
	int		p[2];
	char	buf[8];
	ssize_t	n;

	check("ft_write", pipe(p) == 0, "pipe()");
	n = ft_write(p[1], "hola", 4);
	memset(buf, 0, sizeof(buf));
	read(p[0], buf, 4);
	check("ft_write", n == 4, "retorno != 4");
	check("ft_write", memcmp(buf, "hola", 4) == 0, "datos escritos");
	close(p[0]);
	close(p[1]);
	errno = 0;
	check("ft_write", ft_write(-1, "x", 1) == -1, "fd invalido != -1");
	check("ft_write", errno == EBADF, "errno != EBADF");
}

static void	test_read(void) {
	int		q[2];
	char	buf[8];
	ssize_t	n;

	check("ft_read", pipe(q) == 0, "pipe()");
	write(q[1], "abcd", 4);
	close(q[1]);
	memset(buf, 0, sizeof(buf));
	n = ft_read(q[0], buf, 4);
	check("ft_read", n == 4, "retorno != 4");
	check("ft_read", memcmp(buf, "abcd", 4) == 0, "datos leidos");
	close(q[0]);
	errno = 0;
	check("ft_read", ft_read(-1, buf, 1) == -1, "fd invalido != -1");
	check("ft_read", errno == EBADF, "errno != EBADF");
}

int	main(void) {
	test_strlen();
	test_strcpy();
	test_strcmp();
	test_strdup();
	test_write();
	test_read();
	if (!g_ko)
		printf("TODO OK (0 fallos) [%d checks]\n", g_ok);
	else
		printf("FALLOS: %d de %d checks\n", g_ko, g_ok + g_ko);
	return (g_ko != 0);
}
