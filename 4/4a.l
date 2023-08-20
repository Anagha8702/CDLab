%{
    #include<stdio.h>
    #include<stdlib.h>
    int id = 0, key = 0, op = 0;
%}
%%
"int"|"char"|"double"|"do"|"while"|"float"|"for"|"if"|"return"|"exit"|"switch" {printf("\nKeyword"); key++;}
[a-zA-Z_][a-zA-Z_0-9]* {printf("\nIdentifier"); id++;}
[\+\-\*\/\%\^\&\|\!]  {printf("\nOperator"); op++; }
[ \n]  ;
. ;
%%
int yywrap() {return 1;}
int main(){
    yyin = fopen("a.txt","r");
    yylex();
    printf("\nidentifier = %d, keywwords = %d , operators = %d",id,key,op);
    return 0;
}