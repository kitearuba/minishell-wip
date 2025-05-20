/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_getenv.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: chrrodri <chrrodri@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/20 15:15:58 by chrrodri          #+#    #+#             */
/*   Updated: 2025/05/20 16:45:41 by chrrodri         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../include/minishell.h"

char	*ft_getenv(char **envp, char *key)
{
	size_t	len;

	if (!key)
		return (NULL);
	len = ft_strlen(key);
	while (*envp)
	{
		if (ft_strncmp(*envp, key, len) == 0 && *envp[len] == '=')
			return (*envp + len + 1);
		envp++;
	}
	return (NULL);
}
