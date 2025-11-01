%{
    #include<stdio.h>
    #include<string.h>
    #include<math.h>

    float variaveis[26];

    int yylex();
    extern FILE *yyin; /* declared by the lexer (flex) */
    void yyerror (char *s){
        printf ("%s\n",s);
    }
   
%}

%union {
    int inteiro;
    char string[100];
    float real;
}

%token <real> DECIMAL INTEIRO
%token <inteiro> IDENTIFICADOR
%token <string> TOK_STRING

%token INI FIM FUNC_ESCRITA FUNC_LEITURA FUNC_RAIZ

%left '+' '-'
%left '*' '/'

%type <real> E
%%

program: INI stmt_list FIM;

stmt_list:
        /* empty */
    |   stmt_list stmt
    ;

stmt: assignment ';'
    | leitura ';'
    | escrita ';'
    ;

assignment: IDENTIFICADOR '=' E {
    variaveis[$1] = $3;
}

leitura: FUNC_LEITURA '(' IDENTIFICADOR ')' {
    scanf("%f", &variaveis[$3]);
}

escrita: FUNC_ESCRITA '(' arg_list ')' {
   
}

arg_list: arg_list ',' arg
        | arg
        ;

arg: E { printf("%.2f", $1); }
    | TOK_STRING { printf("%s", $1); }
    ;


E:      E '+' E {$$ = $1 + $3;}
    |   E '*' E {$$ = $1 * $3;}
    |   E '-' E {$$ = $1 - $3;}
    |   E '/' E {$$ = $1 / $3;}
    |   FUNC_RAIZ '(' E ')' { $$ = sqrt($3); }
    |   '(' E ')' {$$ = $2;}
    |   DECIMAL {$$ = $1;}
    |   INTEIRO {$$ = $1;}
    |   IDENTIFICADOR { $$ = variaveis[$1]; }
    ;

%%

int main(){
    yyin = fopen("code.alg0","r");
    if (!yyin) {
        fprintf(stderr, "Erro ao abrir code.alg0\n");
        return 1;
    }
    yyparse();
    fclose(yyin);
    return 0;
}

