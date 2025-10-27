
# Bison

Programas bison tem a mesma estrutua de programas flex, com declarações, regras e código C. As declarações incluem código C para ser copiado para o inicio do parser C gerado, novamente encapsulado em `{%` e `%}`. Seguindo o que são declarações de token `%token`, dizendo ao bison os nomes dos símbolos no parser que são tokens. Por convenção tokens são escritos em caixa alta, embora o bison não exija isso. Todo símbolo não declarado como token deve aparecer do lado esquerdo da ultima regra do programa. 

A segunda seção contém
