/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minishell.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: chrrodri <chrrodri@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/20 16:21:19 by chrrodri          #+#    #+#             */
/*   Updated: 2025/05/20 16:35:24 by chrrodri         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINISHELL_H
# define MINISHELL_H

/* ************************************************************************** */
/*                               DEPENDENCIES                                 */
/* ************************************************************************** */
// --- Standard Libraries ---
# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>
# include <fcntl.h>
# include <sys/stat.h>
# include <sys/types.h>
# include <sys/wait.h>

// --- Readline Libraries ---
# include <readline/readline.h>
# include <readline/history.h>

// --- Libft Custom Library ---
# include "../libft/include/libft.h"
# include "builtin.h"


/* ************************************************************************** */
/*                               Macros                                       */
/* ************************************************************************** */
# define BUILTIN_CMDS ":echo:cd:pwd:export:unset:env:exit"

/* ************************************************************************** */
/*                               Structures                                   */
/* ************************************************************************** */
typedef struct	s_bash
{
    char	**env;
    int		exit_status;
} t_bash;

/* ************************************************************************** */
/*                              FUNCTION PROTOTYPES                           */
/* ************************************************************************** */

// --- Built-ins and command execution ---
//int		ft_cmd(char *cmd, char **envp[]);
int		execute_command(char **argv, t_bash *bash);
int		exec_external(char **args, t_bash *bash);

// --- Command path resolution ---
char	*get_cmd_path(char *cmd, char **envp);

// --- Environment variable handling ---
char	*ft_getenv(char **envp, char *key);

// --- Utilities ---
void	free_2d_array(char **arr);

#endif //MINISHELL_H
