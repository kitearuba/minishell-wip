# include "../include/minishell.h"

int main(void)
{
    char    *line;

    while (1)
    {
        line = readline("minishell $> ");
        if (*line)
            add_history(line);
         printf("%s", line);
        free(line);
    }
    if (line)
        free(line);
    return (0);
}