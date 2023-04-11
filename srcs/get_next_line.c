/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: OrioPrisco <47635210+OrioPrisco@users      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/12 11:19:28 by OrioPrisc         #+#    #+#             */
/*   Updated: 2023/04/11 12:50:11 by OrioPrisc        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "getnextline.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "libft.h"

char	*get_next_line(int fd)
{
	static char	buffer[FOPEN_MAX][BUFFER_SIZE + 1];
	char		*str;
	ssize_t		bytes_read;

	if (fd < 0 || fd >= FOPEN_MAX)
		return (0);
	str = 0;
	if (buffer[fd][0])
		if (ft_strjoin_overflow(&str, buffer[fd]))
			return (str);
	bytes_read = read(fd, buffer[fd], BUFFER_SIZE);
	while (bytes_read > 0)
	{
		if (ft_strjoin_overflow(&str, buffer[fd]))
			return (str);
		bytes_read = read(fd, buffer[fd], BUFFER_SIZE);
	}
	if (bytes_read < 0)
	{
		free(str);
		return (0);
	}
	return (str);
}
