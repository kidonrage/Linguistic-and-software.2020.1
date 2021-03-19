%{ 
#include <stdio.h> 
#include <string.h> 
 
void yyerror(const char *str){ 
   fprintf(stderr, "error: %s\n", str); 
} 
void yywrap(){ 
} 
int yyparse (void); 
int yylex(); 
int main(){ 
   yyparse(); 
} 
%} 
%union { 
     char* str; 
} 
 
%token <str> CONSTANTE DEFINITION TYPE IDENTIFIER BODY_BEGIN BODY_END SEMICOLON 
COMMA SIGNED OBRACKET EBRACKET SUBSTRACTION MULTIPLICATION ADDITION DIVISION 
%type  <str> VAR VARS IDS EXP OPERAND BINARY_OPERATOR UNARY_OPERATOR VYR  SUBVYR ASSIGNMENT OPV 
%% 

PROGRAMM: VARS OPV; 

VARS: VAR { 
  printf("Int %s;\n", $1); 
} | VARS VAR { 
  printf("Int %s;\n", $2); 
};

VAR: DEFINITION IDS TYPE SEMICOLON {
  $$=strcat($2, ""); 
};

IDS: IDENTIFIER { 
  $$=$1; 
} | IDENTIFIER COMMA IDS { 
  $$=strcat($1, " , "); 
  $$=strcat($$, $3); 
};

OPV: BODY_BEGIN EXP BODY_END { 
   printf("\n%s", $1);
   printf("\n%s", $2);
   printf("\n%s", $3);
   printf("\n");
}; 

EXP: ASSIGNMENT { 
  $$=$1; 
} | EXP ASSIGNMENT { 
   $$=strcat($1, $2);
};

ASSIGNMENT: IDENTIFIER SIGNED VYR SEMICOLON { 
  $$=strcat($1, " := "); 
  $$=strcat($$, $3); 
  $$=strcat($$, ";");
}; 

VYR: SUBVYR { 
  $$=$1;
} | UNARY_OPERATOR SUBVYR { 
  $$=strcat($1, $2); 
}; 

SUBVYR: OBRACKET VYR EBRACKET { 
  char buffer [100];
  snprintf ( buffer, 100, "%s %s )", $1, $2 );
  $$=buffer;
} | OPERAND { 
  $$=$1; 
} | SUBVYR BINARY_OPERATOR SUBVYR { 
  char buffer [100];
  snprintf ( buffer, 100, "%s %s %s", $1, $2, $3 );
  $$=buffer;
};

BINARY_OPERATOR: SUBSTRACTION | MULTIPLICATION | ADDITION | DIVISION {
  $$=$1;
}

UNARY_OPERATOR: SUBSTRACTION {
  $$=$1; 
};

OPERAND: IDENTIFIER { 
  $$=$1; 
} | CONSTANTE { 
  $$=$1;
};