#include "../../include/minishell.h"

int exec_external(char **args, t_bash *bash)
{
    (void)bash;
    printf("external command on the works:  %s\n", args[0]);
    return (0);
}