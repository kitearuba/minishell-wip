#ifndef MINISHELL_H
# define MINISHELL_H

# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>
# include <fcntl.h>

# include <sys/stat.h>
# include <sys/types.h>
# include <sys/wait.h>

# include <readline/readline.h>
# include <readline/history.h>

# include "../libft/include/libft.h"

# define BUILTIN_CMDS ":echo:cd:pwd:export:unset:env:exit"

int	ft_cmd(char *cmd, char *envp[]);

#endif //MINISHELL_H
