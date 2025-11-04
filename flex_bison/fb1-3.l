
%%
"+" {printf("SOMA\n");}
"-" {printf("SUBTRAÇÃO\n");}
"*" {printf("MULTIPLICAÇÃO\n");}
"/" {printf("DIVISÃO");}
"|" {printf("MÓDULO");}
[0-9]+ {printf("NUMERO %s\n", yytext);}
\n {printf("NOVA LINHA\n");}
[ \t] {}
. {printf("Caractere Misterioso %s\n", yytext);}

%%
