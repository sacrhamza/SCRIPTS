#include <readline/readline.h>
#include <stdbool.h>
#include <fcntl.h>
#include <stdbool.h>
#include <unistd.h>
#include <readline/history.h>
#include <wait.h>


int main(int argc, char *argv[], char **env)
{
  char *line;
  int fd;
  int pid;

  while (true)
  {
  fd =  open("/tmp/file.c", O_TRUNC | O_RDWR);
    line = readline("c.c> ");
    if (!line)
      _exit(1);
    dprintf(fd, "#include <stdio.h>\n\
    int main(void)\
    {\
    %s\n\
    }\
    ", line);
    pid = fork();
    if (pid == 0)
    {
      execve("/home/hsacr/SCRIPTS/exmake",  (char *[]){"/home/hsacr/SCRIPTS/exmake", "/tmp/file.c", NULL}, env);
    }
    else {
      wait(NULL);
    }
    add_history(line);
    free(line);
    close(fd);
  }
  return (0);
}
