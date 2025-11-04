# Flex e Bison

Flex e bison são ferramentas para constrir programas que processam entradas estruturadas. Eram originalmente usados para construção de compiladores, mas se mostraram úteis em muitas outras áreas. No primeiro capítulo vamos iniciar com uma olhada pela teoria por trás deles, e depois explorar alguns exemplos de uso.


## Análize léxica (scanning) e sintática (parsing)

Os primeiros compiladores lá na década de 50, usavam técnicas ad hoc para analisar a sintaxe de um código fonte ou programas que estavam compilando. Durante a década de 60, o campo recebeu grande atenção acadêmica, e pela década de 70, a análise de sintaxe era um campo bem compreendido.

Um dos insights chave foi a quebra do trabalho em duas partes: análise léxica e análise sintática. 

De modo geral, a análise léxica divide a entrada em partes significativas, chamadas tokens, a análise sintática descobre como os tokens se relacionam entre si.

