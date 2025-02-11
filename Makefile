CC = clang

NAME = minitalk.a

FLAGS = -Wall -Wextra -Werror

SRCS  =   srcs/client/client.c srcs/server/server.c srcs/utils/utils.c srcs/utils/error.c


RM	= rm -f

OBJS = $(SRCS:.c=.o)

.c.o:
	$(CC) $(FLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@ranlib $(NAME)
	@echo "compile minitalk.a"
	@$(CC) srcs/server/server.c -o server minitalk.a
	@$(CC) srcs/client/client.c -o client minitalk.a
clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) $(NAME)
	$(RM) server
	$(RM) client

re: fclean all
