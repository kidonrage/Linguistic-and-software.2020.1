%{
#include <stdio.h>
%}
%option main
%option yylineno
%%
(Var|Begin|End) printf("Keyword\n");
([a-zA-Z]){1}([a-zA-Z]|\_)?+ printf("Identifier\n");
([0-9])+ printf("Constant\n");
(\-|\+|\*|\/|:\=){1} printf("Operation\n");
(\,|\;|\(|\}){1} printf("Delimiter\n");
%%


