%{
    #include <string.h>    
%}

DEC [0-9]+\.[0-9]+
INT [0-9]+
CHAR \'([^"\n])*\'
STRING \"([^"\n])*\"
IDENTIFICADOR [a-zA-Z_][a-zA-Z0-9_]*
IGNORE [ \n\t]+
DELIMITADOR [\{\}\[\]\(\)]
EOL [\;]


%%
     /* COMENTARIOS */
"//".* {printf("COMENTARIO,%s\n", yytext);}
    /* TIPOS PRIMITIVOS */
"int" {printf("TIPO_INTEIRO,%s\n", yytext);}
"dec" {printf("TIPO_DECIMAL,%s\n", yytext);}
"log" {printf("TIPO_LOGICO,%s\n", yytext);}
"car" {printf("TIPO_CARACTERE,%s\n", yytext);}
    /* FUNCOES */
"leia" {printf("FUNC_LEITURA,%s\n", yytext);}
"escreva" {printf("FUNC_ESCRITA,%s\n", yytext);}

"true" {printf("LOGICO_VERDADEIRO,%s\n", yytext);}
"false" {printf("LOGICO_FALSO,%s\n", yytext);}

    /*OPERADORES*/
"==" {printf("OPERADOR_IGUALDADE,%s\n", yytext);}
"*"  {printf("OPERADOR_MULTIPLICACAO,%s\n", yytext);}
"!=" {printf("OPERADOR_DIFERENCA,%s\n", yytext);}
"+"  {printf("OPERADOR_SOMA,%s\n", yytext);}
"-"  {printf("OPERADOR_SUBTRACAO,%s\n", yytext);}
"/"  {printf("OPERADOR_DIVISAO,%s\n", yytext);}
"%"  {printf("OPERADOR_DIVISAO_INTEIRA,%s\n", yytext);}
"<"  {printf("OPERADOR_MENOR,%s\n", yytext);}
">"  {printf("OPERADOR_MAIOR,%s\n", yytext);}

"&&" {printf("OPERADOR LOGICO_AND,%s\n", yytext);}
"||" {printf("OPERADOR LOGICO_OR,%s\n", yytext);}
"=" {printf("ATRIBUICAO,%s\n", yytext);}

    /*ESTRUTURAS*/
"if" {printf("ESTRUTURA_INI_CONDICIONAL,%s\n", yytext);}
"else if" {printf("ESTRUTURA_FIM_INI_CONDICIONAL,%s\n", yytext);}
"else" {printf("ESTRUTURA_FIM_CONDICIONAL,%s\n", yytext);}
"for" {printf("ESTRUTURA_REPETICAO_FOR,%s\n", yytext);}
"while" {printf("ESTRUTURA_REPETICAO_WHILE,%s\n", yytext);}
"do" {printf("ESTRUTURA_REPETICAO_DO_WHILE,%s\n", yytext);}
"switch" {printf("ESTRUTURA_ESCOLHA,%s\n", yytext);}
"break" {printf("INTERRUPÇÃO,%s\n", yytext);}
"case" {printf("ESTRUTURA_ESCOLHA,%s\n", yytext);}
"default" {printf("ESTRUTURA_ESCOLHA_OPADRÃO,%s\n", yytext);}
   
{STRING} {
        yytext[yyleng - 1] = '\0';
        printf("STRING,%s\n", yytext + 1);
    }
{CHAR} {
        yytext[yyleng - 1] = '\0';
        printf("CARACTERE,%s\n", yytext + 1);
    }
{DELIMITADOR} {printf("DELIMITADOR,%s\n", yytext);}
{EOL} {printf("FIM DE LINHA,%s\n", yytext);}
{IGNORE} {}
{IDENTIFICADOR} {printf("IDENTIFICADOR,%s\n", yytext);}
{DEC} {printf("DECIMAL,%s\n", yytext);}
{INT} {printf("INTEIRO,%s\n", yytext);}


%%
int main(){
    yyin = fopen("code.alg0", "r");
    yylex();
    fclose(yyin);  
return 0;
}