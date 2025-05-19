/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minishell.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vdaniely <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/19 17:59:43 by vdaniely          #+#    #+#             */
/*   Updated: 2025/05/19 20:12:07 by vdaniely         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./include/minishell.h"
#include "./libft/include/libft.h"

int	main(int ac, char *argv[], char *envp[])
{
	char	*line;
	char	**e;

	(void)ac;
	e = argv;
	while (1)
	{
		line = readline("minishell $> ");
		if (!line)
		{
			printf("exit\n");
			break ;
		}
		if (*line)
			add_history(line);
		e = ft_split(line, ' ');
		if (e[0] && ft_strnstr(BUILTIN_CMDS, e[0], ft_strlen(BUILTIN_CMDS)))
			ft_cmd(line, envp);
		else
			printf("Comando alternativo: %s\n", line);
		free(line);
	}
	clear_history();
	return (0);
}
