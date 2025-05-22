/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   builtin.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: chrrodri <chrrodri@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/18 14:15:32 by chrrodri          #+#    #+#             */
/*   Updated: 2025/05/20 16:43:48 by chrrodri         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../include/minishell.h"

static int	run_builtin(char **argv, t_bash *bash)
{
    if (ft_strcmp(argv[0], "echo") == 0)
        return (printf("%s\n", argv[0]));
    else if (ft_strcmp(argv[0], "cd") == 0)
        return (printf("%s\n", argv[0]));
    else if (ft_strcmp(argv[0], "pwd") == 0)
        return (printf("%s\n", argv[0]));
    else if (ft_strcmp(argv[0], "export") == 0)
        return (printf("%s\n", argv[0]));
    else if (ft_strcmp(argv[0], "unset") == 0)
        return (printf("%s\n", argv[0]));
    else if (ft_strcmp(argv[0], "env") == 0)
        return (printf("%s\n", argv[0]));
    else if (ft_strcmp(argv[0], "exit") == 0)
        return (printf("%s\n", argv[0]));
    return (1);
	/*
	if (ft_strcmp(argv[0], "echo") == 0)
		return (ft_echo(argv));
	else if (ft_strcmp(argv[0], "cd") == 0)
		return (ft_cd(argv));
	else if (ft_strcmp(argv[0], "pwd") == 0)
		return (ft_pwd(argv));
	else if (ft_strcmp(argv[0], "export") == 0)
		return (ft_export(argv));
	else if (ft_strcmp(argv[0], "unset") == 0)
		return (ft_unset(argv));
	else if (ft_strcmp(argv[/*0], "env") == 0)
		return (ft_env(argv));
	else if (ft_strcmp(argv[0], "exit") == 0)
		return (ft_exit(argv));
	return (1);
	*/
}
static int	is_builtin(const char *cmd)
{
    if (!cmd)
        return (0);
    return (!ft_strcmp(cmd, "cd")
        || !ft_strcmp(cmd, "echo")
        || !ft_strcmp(cmd, "pwd")
        || !ft_strcmp(cmd, "export")
        || !ft_strcmp(cmd, "unset")
        || !ft_strcmp(cmd, "env")
        || !ft_strcmp(cmd, "exit"));
}

int	execute_command(char **argv, t_bash *bash)
{
	if (is_builtin(argv[0]))
		return (run_builtin(argv, bash));
	else
		return (exec_external(argv)); //, bash));
}
