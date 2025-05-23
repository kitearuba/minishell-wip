# **************************************************************************** #
#                              Project Information                             #
# **************************************************************************** #
NAME        = minishell

# **************************************************************************** #
#                            Compiler and Flags                                #
# **************************************************************************** #
CC          = cc
CFLAGS      = -Wall -Wextra -Werror -MMD
MAKE        = make

# **************************************************************************** #
#                              Directories                                     #
# **************************************************************************** #

SRC_DIR         = src
LIBFT_DIR       = libft
INC_DIR         = include

# **************************************************************************** #
#                      File Paths and Dependencies                             #
# **************************************************************************** #

MAKEFILE        = Makefile
HEADER          = $(INC_DIR)/minishell.h $(INC_DIR)/builtin.h
LIBFT_A         = $(LIBFT_DIR)/libft.a
LIBFT_H         = $(LIBFT_DIR)/$(INC_DIR)/libft.h
LIBFT_MAKEFILE  = $(LIBFT_DIR)/$(MAKEFILE)
DEPS            = $(HEADER) $(MAKEFILE)

# **************************************************************************** #
#                          Source Files and Objects                            #
# **************************************************************************** #
SRC = 	minishell.c \
		$(SRC_DIR)/env/ft_getenv.c \
		$(SRC_DIR)/utils/free_2d_array.c \
		$(SRC_DIR)/cmd/run_external_cmd.c \
		$(SRC_DIR)/cmd/execute_commands.c \
		$(SRC_DIR)/executor/get_cmd_path.c \
		$(SRC_DIR)/builtin/builtin.c \
        $(SRC_DIR)/builtin/echo.c \
        $(SRC_DIR)/builtin/cd.c \
        $(SRC_DIR)/builtin/pwd.c \
        $(SRC_DIR)/builtin/export.c \
        $(SRC_DIR)/builtin/unset.c \
        $(SRC_DIR)/builtin/env.c \
        $(SRC_DIR)/builtin/exit.c \
        #$(SRC_DIR)/cmd/cmd.c \


OBJ         = $(SRC:.c=.o)
DEP         = $(OBJ:.o=.d)

# **************************************************************************** #
#                                Headers                                       #
# **************************************************************************** #
INCLUDES    = -I$(INC_DIR) -I$(LIBFT_DIR)

# **************************************************************************** #
#                                Rules                                         #
# **************************************************************************** #

all: $(NAME)

$(NAME): $(OBJ) $(LIBFT_A)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT_A) $(INCLUDES) -lreadline -o $(NAME)

$(SRC_DIR)/%.o: $(SRC_DIR)/%.c $(DEPS)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Rule to rebuild libft.a
$(LIBFT_A): $(LIBFT_MAKEFILE) $(LIBFT_SRC) $(LIBFT_H)
	$(MAKE) -C $(LIBFT_DIR)

clean:
	$(RM) $(OBJ) $(DEP)
	$(MAKE) -C $(LIBFT_DIR)  clean

fclean: clean
	$(RM) $(NAME)
	$(RM) $(LIBFT_A)

re: fclean all

-include $(DEP)

.PHONY: all clean fclean re bonus
