%option noyywrap 
%{ 
#include <stdio.h> 
#include "y.tab.h" 
#include <string.h> 
#ifndef YYSTYPE 
#define YYSTYPE char* 
#endif 
#define INTEGER 270 
%} 
%% 
[0-9]+      {yylval.str=strdup(yytext);  return  CONSTANTE;} 
(Var)      {yylval.str=strdup(yytext);  return DEFINITION;}  
(\:Integer)      {yylval.str=strdup(yytext);  return TYPE;}
(Begin){1}    {yylval.str=strdup(yytext);  return  BODY_BEGIN;} 
(End){1}    {yylval.str=strdup(yytext);  return BODY_END;} 
([a-zA-Z]){1}([a-zA-Z]|\_)*       {yylval.str=strdup(yytext); return IDENTIFIER;} 
(\-){1}         {yylval.str=strdup(yytext);  return  SUBSTRACTION;} 
(\*){1}         {yylval.str=strdup(yytext);  return  MULTIPLICATION;}
(\+){1}         {yylval.str=strdup(yytext);  return  ADDITION;}
(\/){1}         {yylval.str=strdup(yytext);  return  DIVISION;}
(\;){1}     {yylval.str=strdup(yytext);  return  SEMICOLON;} 
(\,){1}     {yylval.str=strdup(yytext);  return COMMA;} 
(\=){1}     {yylval.str=strdup(yytext);  return SIGNED;} 
(\(){1}     {yylval.str=strdup(yytext);  return OBRACKET;} 
(\}){1}     {yylval.str=strdup(yytext);  return EBRACKET;} 
\n ; 
[ \t]+ 
%%