%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token NUM
%left '+' '-'
%left '/' '*'
%%
S:I         {printf("\nResult is %d",$$);}
;
I:I'+'I   {$$=$1+$3;}
|I'-'I    {$$=$1-$3;}
|I'*'I    {$$=$1*$3;}
|'('I')'  {$$=$2;}
|I'/'I    {$$=$1/$3;}
|NUM      {$$=$1;}
|'-'NUM   {$$=-$2;}
;
%%
int main(){
    printf("\nEnter the expression:\n");
    yyparse();
    return 0;
}
int yyerror(){
    printf("\nInvalid expression");
}