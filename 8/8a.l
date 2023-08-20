%{
    #include "y.tab.h"
    #include<string.h>
%}
%%
[a-zA-Z_][a-zA-Z_0-9]* {yylval.exp = strdup(yytext); return IDEN;}
[0-9]+ {yylval.exp = strdup(yytext);  return NUM;}
[\n] return '\n';
[-/+*()=] return yytext[0];
. ;
%%