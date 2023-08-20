%{
   #include<stdio.h>
   #include<stdlib.h>
%}
%token TYPE RET IDEN NUM
%left '+' '-'
%left '*' '/'
%%
S:FUN {printf("\nAccepted!"); exit(0);}
;
FUN: TYPE IDEN '('PARAMS')' '{'BODY'}'
;
PARAMS:PARAMS ',' PARAM
|PARAM
;
PARAM:TYPE IDEN
;
BODY:STMT BODY
|RET E';'
|
;
STMT:PARAM';'
|E';'
|a';'
;
a:IDEN'='E
;
E:E'+'E
|E'-'E 
|E'*'E 
|E'/'E 
|'('E')'
|IDEN
|NUM
;
%%
int yyerror() {printf("\nSyntax error!"); exit(0); }
int main(){
    printf("\nEnter code snippet: \n");
    yyparse();
    return 0;
}
