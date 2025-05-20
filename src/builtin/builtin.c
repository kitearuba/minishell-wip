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

static int	run_builtin(char **argv)
{
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
	else if (ft_strcmp(argv[0], "env") == 0)
		return (ft_env(argv));
	else if (ft_strcmp(argv[0], "exit") == 0)
		return (ft_exit(argv));
	return (1);
}

int	execute_command(char **argv, char **envp)
{
	if (is_builtin(argv[0]))
		return (run_builtin(argv));
	else
		return (execute_external(argv, envp));
}
