%{
        #include<stdio.h>
        #include<stdlib.h>
        int single = 0, mlines = 0, multi = 0;
%}
%%
"//"[^\n]* {single++;}
"/*"[^*]*"*/"  {
    multi++;
    for (int i=0; i < yyleng; i++){
        if(yytext[i]=='\n') {mlines++;}
    }
}
%%
int main(){
    yyin = fopen("a.txt","r");
    yyout = fopen("acopy.txt","w");
    yylex();
    return 0;
}
int yywrap() { return 1; }