%{
    #include<stdio.h>
    #include<stdlib.h>
    typedef char * string;
    struct{
        string op1,op2,res;
        char op;
    }code[100];
    int idx = -1;
    string addtotable(string,string,char);
    void targetcode();
%}
%union{
    char * exp;
}
%token <exp> NUM IDEN
%type <exp> EXP a
%left '+' '-'
%left '/' '*'
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
int yyerror() {printf("\nError!"); exit(0); }
int main(){
    printf("\nEnter code: ");
    yyparse();
    printf("\nTarget code : \n");
    targetcode();
}
string addtotable(string op1,string op2,char op){
    if(op=='='){
        idx++;
        string res = malloc(3);
        sprintf(res,"@%c",idx+'A');
        code[idx].res = op1;
        code[idx].op1 = op2;
        code[idx].op2 = ' ';
	code[idx].op = '=';
        return res;
    }
    else{
        idx++;
        string res = malloc(3);
        sprintf(res,"@%c",idx+'A');
        code[idx].op1 = op1;
        code[idx].op2 = op2;
        code[idx].op = op;
        code[idx].res = res;
        return res;
    }
}

void targetcode(){
    for(int i = 0; i<=idx;i++){
        string instr;
        switch(code[i].op){
            case '+': instr = "ADD"; break;
            case '-': instr = "SUB"; break;
            case '*': instr = "MUL"; break;
            case '/': instr = "DIV"; break;
        }
        printf("\nLOAD R1, %s",code[i].op1);
        printf("\nLOAD R2, %s",code[i].op2);
        printf("\n%s R3, R1, R2",instr);
        printf("\nSTORE %s, R3",code[i].res);
    }
}
