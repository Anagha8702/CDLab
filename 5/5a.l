%{
   #include "y.tab.h"
%}
%%
"int"|"float"|"double"|"char" {return TYPE;}
[0-9]+ {return NUM;}
[a-zA-Z_][a-zA-Z_0-9]* {return IDEN;}
"["|"]"|","|";" {return yytext[0];}
. ;
%%
