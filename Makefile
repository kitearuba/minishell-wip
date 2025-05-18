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

# **************************************************************************** #
#                              Directories                                     #
# **************************************************************************** #
SRC_DIR     = src
INC_DIR     = include

# **************************************************************************** #
#                          Source Files and Objects                            #
# **************************************************************************** #
SRC = \
	$(SRC_DIR)/main.c \

OBJ         = $(SRC:.c=.o)
DEP         = $(OBJ:.o=.d)

# **************************************************************************** #
#                                Headers                                       #
# **************************************************************************** #
INCLUDES    = -I$(INC_DIR)

# **************************************************************************** #
#                                Rules                                         #
# **************************************************************************** #

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(INCLUDES) -lreadline -o $(NAME)

# Compile source files into object files
$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Clean object and dependency files
clean:
	$(RM) $(OBJ) $(DEP)

# Clean everything
fclean: clean
	$(RM) $(NAME)

# Recompile everything
re: fclean all

# Bonus rule (placeholder, you can add _bonus.c and .h files)
bonus:
	$(MAKE) BONUS=1 all

-include $(DEP)

.PHONY: all clean fclean re bonus