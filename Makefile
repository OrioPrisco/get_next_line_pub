# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: OrioPrisco <47635210+OrioPrisco@users      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/05 15:21:36 by OrioPrisc         #+#    #+#              #
#    Updated: 2023/04/11 12:50:11 by OrioPrisc        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	libgetnextline.a
SRC				=	get_next_line.c\
					get_next_line_utils.c
SRC_FOLDER		=	srcs/
HEADERS_FOLDER	=	includes/\
					../includes/ #path to libft.h
OBJS			=	$(patsubst %.c,$(OBJ_FOLDER)%.o,$(SRC))
OBJ_FOLDER		=	objs/
CC				=	cc
CFLAGS			=	-Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

$(OBJ_FOLDER)%.o : $(SRC_FOLDER)%.c
	$(CC) -c -fPIC $(CFLAGS) $(addprefix -I,$(HEADERS_FOLDER)) $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME) $(LIBFT)

re: fclean all

.PHONY: all clean fclean re
.SUFFIXES:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
