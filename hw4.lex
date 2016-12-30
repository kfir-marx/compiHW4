%{
	 #include "hw4_bison.tab.hpp"	
 	 char* var_name;
 	 char* var_type;
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
C 	                             {var_type = yytext; return CELSIUS;};
F                                {return FAHRENHEIT;};
K	                             {return KELVIN;};
\"[^"]*\"                        return STRING;
"int"                            {return INT;};
"print"	                         return PRINT;
"input"                          return INPUT;
"true"                           return TRUE;
"false"                          return FALSE;
"if"                             return IF;
"else"                           return ELSE;
"while"                          return WHILE;
"break"                          return BREAK;
"not"                            return NOT;
"bool"                           {return BOOL;};
"switch"                         return SWITCH;
"case"                           return CASE;
0|[1-9][0-9]*                    return NUM;            
[a-zA-Z_]+                       {return ID;};

"//"[^\n]*\n 		             ;		//ignore line comments
[ \t]				             ;		//ignore spaces and tabs
\r\n|\n				             ;		//ignore new-line character

%%
