%{
	 #include "hw4_bison.tab.hpp"
     #include <string>
     extern string var_name;
     extern string var_type;
%}

%option yylineno
%option noyywrap

%%

"("                              return LP;
")"                              return RP;
"{"                              return LC;
"}"                              return RC;
";"                              return SC;
":"					             return COLON;
"="                              return ASSIGN;
[+]                              return PLUS;
[-]                              return MINUS;
[*]                              return MULT;
[/]                              return DIV;
"<="|">="|"=="|"!="|">"|"<"      return REL_OP;
"and"    		                 return AND;
"or"    		                 return OR;
C 	                             {var_type = string(yytext); return CELSIUS;};
F                                {var_type = string(yytext); return FAHRENHEIT;};
K	                             {var_type = string(yytext); return KELVIN;};
\"[^"]*\"                        return STRING;
"int"                            {var_type = string(yytext); return INT;};
"print"	                         return PRINT;
"input"                          return INPUT;
"true"                           return TRUE;
"false"                          return FALSE;
"if"                             return IF;
"else"                           return ELSE;
"while"                          return WHILE;
"break"                          return BREAK;
"not"                            return NOT;
"bool"                           {var_type = string(yytext); return BOOL;};
"switch"                         return SWITCH;
"case"                           return CASE;
0|[1-9][0-9]*                    return NUM;
             
[a-zA-Z_]+                       {var_name = string(yytext); return ID;};

"//"[^\n]*\n 		             ;
[ \t]				             ;
\r\n|\n				             ;

%%
