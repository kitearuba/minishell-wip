# include "../../include/minishell.h"

int run_builtin(char **argv)
{
    if (strcmp(argv[0], "echo") == 0)
        return (ft_echo(argv));
    else if (strcmp(argv[0], "cd") == 0)
        return (ft_cd(argv));
    else if (strcmp(argv[0], "exit") == 0)
        return (ft_exit(argv));
    return (1);
}

int execute_command(char **argv, char **envp)
{
    if (is_builtin(argv[0]))
        return (run_builtin(argv));
    else
        return (execute_external(argv, envp));
}