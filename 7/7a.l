%{
    #include "y.tab.h"
%}
%%
"int"|"double"|"float"|"char" {return TYPE;}
"return" {return RET;}
[a-zA-Z_][a-zA-Z_0-9]* {return IDEN;}
[0-9]+ {return NUM;}
[\n\t ]+ ;
. return yytext[0];
%%
