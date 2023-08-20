%{
#include<stdio.h>
#include<stdlib.h>
int pint = 0, nint = 0, pfrac = 0, nfrac = 0;
%}
num [0-9]
%%
\+?{num}+ {pint++;}
-{num}+   {nint++;}
\+?{num}+\/{num}+ {pfrac++;}
-{num}+\/{num}+ {nfrac++;}
-{num}+\/-{num}+ {pfrac++;}
\+?{num}+\/-{num}+  {nfrac++;}
\+?{num}*\.{num}+  {pfrac++;}
-{num}*\.{num}+    {nfrac++;}
# {return 0;}
. ECHO;
%%
int yywrap() { return 1; }
int main(){
    printf("\nEnter the numbers: \n");
    yylex();
    printf("\nNumber of pint = %d, nint = %d , pfrac = %d, nfrac = %d",pint,nint,pfrac,nfrac);
    return 0;
}