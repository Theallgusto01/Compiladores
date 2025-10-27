%{
// Definimos o numero dos tokens com um enum C
enum yytokentype {
    NUMBER = 258,
    ADD = 259,
    SUB = 260,
    MUL = 261,
    DIV = 262,
    ABS = 263,
    EOL = 264
};

int yyval; // variável que armazenará o valor do token 
    
%}

%%

"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"|" {return ABS;}
[0-9]+ {yyval = atoi(yytext); return NUMBER;}
\n {return EOL;}
[ \t] {/* ignorar espaço em branco */}
. {printf("caracter misterioso %c\n", *yytext);}

%%

void main(int argc, char **argv){
    
    int tok;

    while(tok = yylex()){
        printf("%d", tok);
        if(tok == NUMBER) printf(" = %d\n", yyval);
        else printf("\n");
    }
}

