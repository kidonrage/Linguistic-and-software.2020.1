%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
[0-9]+ return CONSTANTE;
(Var) return DEFINITION;
(\:Integer) return TYPE;
(Begin){1} return BODY_BEGIN;
(End){1} return BODY_END;
([a-zA-Z]){1}([a-zA-Z]|\_)* return IDENTIFIER;
(\-|\+|\*|\/){1} return BINARY_OPERATOR;
(\-){1} return UNARY_OPERATOR;
(\;){1} return SEMICOLON;
(\,){1} return COMMA;
(\=){1} return SIGNED;
(\(){1} return OBRACKET;
(\}){1} return EBRACKET;
\n ;
[ \t]
%%