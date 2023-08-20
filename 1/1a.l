%{
#include<stdio.h>
#include<stdlib.h>
int words = 0, chars = 0, lines = 0, spaces = 0;
%}
%%
\n {lines++;}
\t {spaces+=4;}
[ ] {spaces++;}
[^ \t\n#]+ {words++; chars+=yyleng;}
# {return 0;}
%%
int yywrap(){ return 1; }
int main(){
    printf("\nEnter the text\n");
    yylex();
    printf("\nwords = %d, chars = %d, lines = %d, spaces = %d",words,chars,lines,spaces);
    return 0;
}
