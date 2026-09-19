CC = cc

FLAGS = -Wall -Wextra -Werror

NAME = fractol

FILES = 

OBJECT_FILES = $(FILES:%.c=%.o)

HEADER_FILE = 

all: $(NAME)

RM = rm -f

%.o: %.c
	$(CC) $(FLAGS) $< -o $@

$(NAME): $(OBJECT_FILES)
	$(CC) $(FLAGS) $^

clean:
	$(RM) $(OBJECT_FILES) 

fclean: clean
	$(RM) $(NAME)

re: fclean all

DATE = $(shell date +%F/%H/%M)

push:
	push "automatic push $(DATE)"

norm:
	norminette $(FILES) $(HEADER_FILE)
