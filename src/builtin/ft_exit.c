
#include "../../include/builtin.h"

int ft_exit(char **argv, t_bash *bash)
{
    (void)argv;
    (void)bash;
    return (printf("Called: ft_exit\n"));
}