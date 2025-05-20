/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cmd.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vdaniely <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/19 17:47:34 by vdaniely          #+#    #+#             */
/*   Updated: 2025/05/19 20:13:37 by vdaniely         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../include/minishell.h"

void	exit_with_perror(char *msg, int exit_type)
{
	perror(msg);
	exit(exit_type);
}

static void	ft_free_array(char *arr[])
{
	int	i;

	i = -1;
	while (arr[++i])
		free(arr[i]);
	free(arr);
}

static char	**ft_clear_mallocs(char *arr1[], char *arr2[], char *arr3[])
{
	if (arr1)
		ft_free_array(arr1);
	if (arr2)
		ft_free_array(arr2);
	if (arr3)
		ft_free_array(arr3);
	return (NULL);
}

static int	get_array_length(char *arr[])
{
	int	length;

	length = 0;
	while (arr[length])
		length++;
	return (length);
}

static char	*ft_getpath(char *envp[])
{
	int		i;

	i = -1;
	while (envp[++i])
	{
		if (!ft_strncmp(envp[i], "PATH", 4))
			return (envp[i]);
	}
	ft_putendl_fd("PATH variable does not found", 2);
	return (NULL);
}

static char	**ft_getpath_array(char *path)
{
	char	**path_arr;
	char	*only_path;
	char	**ret_arr;
	int		len;

	only_path = ft_substr(path, 5, ft_strlen(path));
	path_arr = ft_split(only_path, ':');
	free(only_path);
	if (!path_arr)
		return (NULL);
	len = get_array_length(path_arr);
	ret_arr = (char **)malloc((len + 1) * sizeof(char *));
	if (!ret_arr)
		return (ft_clear_mallocs(path_arr, NULL, NULL));
	len = -1;
	while (path_arr[++len])
	{
		ret_arr[len] = ft_strjoin(path_arr[len], "/");
		if (!ret_arr[len])
			return (ft_clear_mallocs(path_arr, ret_arr, NULL));
	}
	ret_arr[len] = NULL;
	ft_free_array(path_arr);
	return (ret_arr);
}

static char	**ft_getfullcmd(char *cmd, char *path[])
{
	char	*fullcmd;
	char	**split_cmd;
	int		i;

	split_cmd = ft_split(cmd, ' ');
	if (!split_cmd)
		return (NULL);
	i = -1;
	while (path[++i])
	{
		fullcmd = ft_strjoin(path[i], split_cmd[0]);
		if (!fullcmd)
			return (ft_clear_mallocs(split_cmd, NULL, NULL));
		if (!access(fullcmd, F_OK | X_OK))
		{
			free(split_cmd[0]);
			split_cmd[0] = fullcmd;
			return (split_cmd);
		}
		free(fullcmd);
	}
	ft_free_array(split_cmd);
	ft_putendl_fd("The command does not exist or no rights in the PATH", 2);
	return (NULL);
}

static char	*exec_handler(char *cmd, char *envp[])
{
	char	**fullcmd;
	char	**curr_path;
	char	**full_path;

	full_path = ft_split(ft_getpath(envp), ' ');
	if (!full_path)
		return (NULL);
	curr_path = ft_getpath_array(ft_getpath(envp));
	if (!curr_path)
		return ((char *)ft_clear_mallocs(full_path, NULL, NULL));
	if (ft_strchr(cmd, '/'))
		fullcmd = ft_split(cmd, ' ');
	else if (ft_strlen(cmd))
		fullcmd = ft_getfullcmd(cmd, curr_path);
	if (!fullcmd)
		return ((char *)ft_clear_mallocs(full_path, curr_path, NULL));
	if (execve(fullcmd[0], fullcmd, full_path) == -1)
	{
		perror("execve");
		ft_clear_mallocs(fullcmd, full_path, curr_path);
		exit(1);
	}
	return (NULL);
}

static int	exec_cmd(char *cmd, char *envp[])
{
	int			pid;

	pid = fork();
	if (pid < 0)
		exit_with_perror("fork does not opened", EXIT_FAILURE);
	if (pid == 0)
	{
		if (!ft_strlen(cmd))
		{
			ft_putendl_fd("Command '' not found", 2);
			exit(127); // Este exit y tal vez otros, no deben aplicar a nuestro programa, sino al proceso del pipex.
		}
		exec_handler(cmd, envp);
		exit (EXIT_FAILURE);
	}
	return (pid);
}

int	ft_cmd(char *cmd, char *envp[])
{
	int	pid;
	int	status;

	pid = exec_cmd(cmd, envp);
	waitpid(pid, &status, 0);
	if (WIFEXITED(status) && WEXITSTATUS(status) != 0)
		return (WEXITSTATUS(status));
	return (0);
}
