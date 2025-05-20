# **************************************************************************** #
#                              Project Information                             #
# **************************************************************************** #
NAME        = minishell

# **************************************************************************** #
#                            Compiler and Flags                                #
# **************************************************************************** #
CC          = cc
CFLAGS      = -MMD #-Wall -Wextra -Werror
RM          = rm -rf
MAKE        = make

# **************************************************************************** #
#                              Directories                                     #
# **************************************************************************** #
SRC_DIR     = src
INC_DIR     = include
LIBFT_DIR   = libft
LIBFT_A     = $(LIBFT_DIR)/libft.a

# **************************************************************************** #
#                          Source Files and Objects                            #
# **************************************************************************** #
SRC = 	minishell.c \
		$(SRC_DIR)/env/ft_getenv.c \
		#$(SRC_DIR)/builtin/builtin.c \
        		$(SRC_DIR)/builtin/echo.c \
        		$(SRC_DIR)/builtin/cd.c \
        		$(SRC_DIR)/builtin/pwd.c \
        		$(SRC_DIR)/builtin/export.c \
        		$(SRC_DIR)/builtin/unset.c \
                $(SRC_DIR)/builtin/env.c \
                $(SRC_DIR)/builtin/exit.c \
        		$(SRC_DIR)/cmd/cmd.c \

OBJ         = $(SRC:.c=.o)
DEP         = $(OBJ:.o=.d)

# **************************************************************************** #
#                                Headers                                       #
# **************************************************************************** #
INCLUDES    = -I$(INC_DIR) -I$(LIBFT_DIR)

# **************************************************************************** #
#                                Rules                                         #
# **************************************************************************** #

all: $(LIBFT_A) $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT_A) $(INCLUDES) -lreadline -o $(NAME)

$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(LIBFT_A):
	$(MAKE) -C $(LIBFT_DIR)

clean:
	$(RM) $(OBJ) $(DEP)
	$(MAKE) -C $(LIBFT_DIR) 

fclean: clean
	$(RM) $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all

bonus:
	$(MAKE) BONUS=1 all

-include $(DEP)

.PHONY: all clean fclean re bonus
