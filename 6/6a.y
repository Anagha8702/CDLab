%{
    #include<stdio.h>
    #include<stdlib.h>
    typedef char* string;
    struct{
        string op1,op2,res;
        char op;
    }code[100];
    int idx = -1;
    string addtotable(string,string,char);
    void threeaddr();
    void quadruples();
%}
%union {
    char * exp;
}
%token <exp> IDEN NUM 
%type <exp> EXP a
%left '+' '-'
%left '*' '/'
%nonassoc '='
%%
STMTS: STMTS STMT
|STMT
;
a:IDEN'='EXP   {$$ = addtotable($1,$3,'=');}
STMT:EXP '\n'
;
EXP:IDEN         {$$ = $1;}
|NUM          {$$ = $1;}
|'('EXP')'    {$$ = $2;}
|EXP'+'EXP {$$ = addtotable($1,$3,'+');}
|EXP'-'EXP    {$$ = addtotable($1,$3,'-');}
|EXP'*'EXP    {$$ = addtotable($1,$3,'*');}
|EXP'/'EXP    {$$ = addtotable($1,$3,'/');}
|a
;
%%
int yyerror() {printf("\nError in syntax!"); exit(0); }

int main(){
    printf("\nEnter expression: \n");
    yyparse();
    printf("\n3addr");
    threeaddr();
    printf("\nQuadruples");
    quadruples();
}

string addtotable(string op1, string op2, char op){
    idx++;
    if(op=='='){
        code[idx].res = op1;
        code[idx].op2 = op1;
        code[idx].op = op;
        return op1;
    }
    else{
        string res = malloc(3);
        sprintf(res,"@%c",idx+'A');
        code[idx].op1 = op1;
        code[idx].op2 = op2;
        code[idx].op = op;
        code[idx].res = res;
        return res;
    }
}

void threeaddr(){
printf("\nRes\top1\top\top2\n");
    for(int i = 0;i<=idx;i++)
       
        printf("\n%s\t%s\t%c\t%s",code[i].res,code[i].op1,code[i].op,code[i].op2);
    
}

void quadruples(){
	printf("\n  \tRes\top1\top2\top\n");
    for(int i = 0;i<=idx;i++)
        printf("\n%d:\t%s\t%s\t%s\t%c",i,code[i].res,code[i].op1,code[i].op2,code[i].op);
    }