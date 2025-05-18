# **************************************************************************** #
#                              Project Information                             #
# **************************************************************************** #
NAME        = minishell

# **************************************************************************** #
#                            Compiler and Flags                                #
# **************************************************************************** #
CC          = cc
CFLAGS      = -Wall -Wextra -Werror -MMD
RM          = rm -rf
MAKE			= make

# **************************************************************************** #
#                              Directories                                     #
# **************************************************************************** #
SRC_DIR     	= src
INC_DIR     	= include
LIBFT_DIR		= libft
MAKEFILE 		= Makefile
LIBFT_A 		= $(LIBFT_DIR)/libft.a
LIBFT_H 		= $(LIBFT_DIR)/$(INC_DIR)/libft.h
LIBFT_MAKEFILE 	= $(LIBFT_DIR)/$(MAKEFILE)

# **************************************************************************** #
#                          Source Files and Objects                            #
# **************************************************************************** #
SRC = \
	$(SRC_DIR)/core/minishell.c \

OBJ         = $(SRC:.c=.o)
DEP         = $(OBJ:.o=.d)

LIBFT_SRCS := $(LIBFT_DIR)/$(SRC_DIR)/ft_isalpha.c $(LIBFT_DIR)/$(SRC_DIR)/ft_isdigit.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_isalnum.c $(LIBFT_DIR)/$(SRC_DIR)/ft_isascii.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_isprint.c $(LIBFT_DIR)/$(SRC_DIR)/ft_strlen.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_memset.c $(LIBFT_DIR)/$(SRC_DIR)/ft_bzero.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_memcpy.c $(LIBFT_DIR)/$(SRC_DIR)/ft_memmove.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_strlcpy.c $(LIBFT_DIR)/$(SRC_DIR)/ft_strlcat.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_toupper.c $(LIBFT_DIR)/$(SRC_DIR)/ft_tolower.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_strchr.c $(LIBFT_DIR)/$(SRC_DIR)/ft_strrchr.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_strncmp.c $(LIBFT_DIR)/$(SRC_DIR)/ft_memchr.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_memcmp.c $(LIBFT_DIR)/$(SRC_DIR)/ft_strnstr.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_atoi.c $(LIBFT_DIR)/$(SRC_DIR)/ft_calloc.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_strdup.c $(LIBFT_DIR)/$(SRC_DIR)/ft_substr.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_strjoin.c $(LIBFT_DIR)/$(SRC_DIR)/ft_strtrim.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_split.c $(LIBFT_DIR)/$(SRC_DIR)/ft_itoa.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_strmapi.c $(LIBFT_DIR)/$(SRC_DIR)/ft_striteri.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_putchar_fd.c $(LIBFT_DIR)/$(SRC_DIR)/ft_putstr_fd.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_putendl_fd.c $(LIBFT_DIR)/$(SRC_DIR)/ft_putnbr_fd.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_lstnew_bonus.c $(LIBFT_DIR)/$(SRC_DIR)/ft_lstadd_front_bonus.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_lstsize_bonus.c $(LIBFT_DIR)/$(SRC_DIR)/ft_lstlast_bonus.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_lstadd_back_bonus.c $(LIBFT_DIR)/$(SRC_DIR)/ft_lstdelone_bonus.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_lstclear_bonus.c $(LIBFT_DIR)/$(SRC_DIR)/ft_lstiter_bonus.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_lstmap_bonus.c $(LIBFT_DIR)/$(SRC_DIR)/ft_printf.c \
             $(LIBFT_DIR)/$(SRC_DIR)/print_format.c $(LIBFT_DIR)/$(SRC_DIR)/ft_putunbr.c \
             $(LIBFT_DIR)/$(SRC_DIR)/ft_puthex.c $(LIBFT_DIR)/$(SRC_DIR)/handle_char.c \
             $(LIBFT_DIR)/$(SRC_DIR)/handle_string.c $(LIBFT_DIR)/$(SRC_DIR)/handle_pointer.c \
             $(LIBFT_DIR)/$(SRC_DIR)/handle_int.c $(LIBFT_DIR)/$(SRC_DIR)/handle_uint.c \
             $(LIBFT_DIR)/$(SRC_DIR)/handle_hex.c $(LIBFT_DIR)/$(SRC_DIR)/handle_percent.c \
             $(LIBFT_DIR)/$(SRC_DIR)/utils.c $(LIBFT_DIR)/$(SRC_DIR)/get_next_line.c \
             $(LIBFT_DIR)/$(SRC_DIR)/get_next_line_bonus.c $(LIBFT_DIR)/$(SRC_DIR)/ft_strappend.c

LIBFT_OBJS = $(LIBFT_SRCS:.c=.o)

# **************************************************************************** #
#                                Headers                                       #
# **************************************************************************** #
INCLUDES    = -I$(INC_DIR)

# **************************************************************************** #
#                                Rules                                         #
# **************************************************************************** #

all: $(NAME)

$(NAME): $(OBJ) $(LIBFT_A)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT_A) $(INCLUDES) -lreadline -o $(NAME)


$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJ) $(DEP)
	$(MAKE) -C $(LIBFT_DIR) clean

# Clean everything
fclean: clean
	$(RM) $(NAME)
	$(RM) $(LIBFT_A)


re: fclean all

bonus:
	$(MAKE) BONUS=1 all

-include $(DEP)

.PHONY: all clean fclean re bonus