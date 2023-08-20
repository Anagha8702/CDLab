%{
    #include<stdio.h>
    #include<stdlib.h>
    int cnt = 0;
%}
%token IF IDEN NUM
%%
S:I
;
I:IF A B	{cnt++;}
;
A:'('E')'
;
E:IDEN Z IDEN
|IDEN Z NUM
|IDEN U
|IDEN
;
Z:'='|'>'|'<'|'<''='|'>''='|'=''+'|'=''-'
;
U:'+''+'|'-''-' 
;
B:'{'B1'}'
|B1
;
B1:E';'B1
|I
|
;
%%
int yyerror() {printf("\nInvalid syntax!"); exit(0); }
int main(){
    printf("\nEnter the code snippet: ");
    yyparse();
    printf("\nNumber of nested IF conditions = %d",cnt);
    return 0;
}

