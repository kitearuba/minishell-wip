#ifndef BUILTIN_H
# define BUILTIN_H

int ft_echo(char **argv, t_bash *bash);
int ft_cd(char **argv, t_bash *bash);
int ft_pwd(char **argv, t_bash *bash);
int ft_export(char **argv, t_bash *bash);
int ft_unset(char **argv, t_bash *bash);
int ft_env(char **argv, t_bash *bash);
int ft_exit(char **argv, t_bash *bash);

#endif
