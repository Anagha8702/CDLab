%{
        #include<stdio.h>
        #include<stdlib.h>
        int cnt = 0;
%}
%token IDEN NUM TYPE
%%
DT: TYPE L';'
;
L: L','B
|B
;
B:IDEN'['NUM']' {cnt++;}
|IDEN           {cnt++;}
;
%%
int yyerror() {printf("\nSyntax does not match"); exit(0);}
int main(){
    printf("\nEnter the statement: ");
    yyparse();
    printf("\nThe number of vars = %d",cnt);
    return 0;
}