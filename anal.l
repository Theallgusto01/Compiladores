%{
    
    
 
%}


DIG [0-9]+
CHAR [a-zA-Z]+
IGNORE [' '\s\n\t]+
DELIMITADOR [\{\}\[\]\(\)]
EOL [\;]


%%
    /*TIPOS*/
"INT" {printf("TIPO: INTEIRO | %s\n", yytext);}
"DEC" {printf("TIPO: DECIMAL | %s\n", yytext);}
"LOG" {printf("TIPO: LOGICO | %s\n", yytext);}


"true" {printf("VERDADEIRO | %s\n", yytext);}
"false" {printf("FALSO | %s\n", yytext);}

    /*OPERADORES*/
"==" {printf("OPERADOR: IGUALDADE | %s\n", yytext);}
"*"  {printf("OPERADOR: MULTIPLICACAO: %s\n", yytext);}
"!=" {printf("OPERADOR: DIFERENCA | %s\n", yytext);}
"+"  {printf("OPERADOR: SOMA | %s\n", yytext);}
"-"  {printf("OPERADOR: SUBTRACAO | %s\n", yytext);}
"/"  {printf("OPERADOR: DIVISAO | %s\n", yytext);}
"%"  {printf("OPERADOR: DIVISAO_INTEIRA | %s\n", yytext);}

"&&" {printf("OPERADOR LOGICO: AND | %s\n", yytext);}
"||" {printf("OPERADOR LOGICO: OR | %s\n", yytext);}

{DELIMITADOR} {printf("DELIMITADOR | %s\n", yytext);}
{EOL} {printf("FIM DE LINHA | %s\n", yytext);}
{IGNORE} {}
"=" {printf("ATRIBUICAO: | %s\n", yytext);}

    /*ESTRUTURAS*/
"if" {printf("ESTRUTURA: INI_CONDICIONAL | %s\n", yytext);}
"else if" {printf("ESTRUTURA: FIM_INI_CONDICIONAL | %s\n", yytext);}
"else" {printf("ESTRUTURA: FIM_CONDICIONAL | %s\n", yytext);}
"for" {printf("ESTRUTURA: REPETICAO | %s\n", yytext);}

    /*INSTRUCOES*/
{CHAR}({DIG}|{CHAR})* {printf("INSTRUCAO: VARIAVEL | %s\n", yytext);}


({DIG}+|({DIG}+.{DIG}+)+) {printf("TIPO: NUMERO | %s\n", yytext);}

%%

int main(){
    yyin = fopen("code.alg0", "r");
    yylex();
    fclose(yyin);  
return 0;
}