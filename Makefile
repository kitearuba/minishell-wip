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
SRC = \
	$(SRC_DIR)/core/minishell.c

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

# Compile minishell with libft
$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT_A) $(INCLUDES) -lreadline -o $(NAME)

# Compile object files
$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Compile libft
$(LIBFT_A):
	$(MAKE) -C $(LIBFT_DIR)

# Clean minishell objects
clean:
	$(RM) $(OBJ) $(DEP)
	$(MAKE) -C $(LIBFT_DIR) clean

# Clean all
fclean: clean
	$(RM) $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean

# Recompile everything
re: fclean all

# Bonus placeholder
bonus:
	$(MAKE) BONUS=1 all

-include $(DEP)

.PHONY: all clean fclean re bonus
