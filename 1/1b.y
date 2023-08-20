%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%%
S:A B
;
A:'a'A'b'
|
;
B:'b'B'c'
|
;
%%
int main(){
    printf("\nEnter the input : ");
    yyparse();
    printf("\nValid input\n");
    return 0;
}
int yyerror(){
    printf("\nInvalid syntax");
    exit(0);
}